import "dart:isolate";

Future<O> computeThreading<I, O>(
  O Function(O, O) compare,
  O Function(I) compute,
  List<Iterable<I>> ranges,
) async {
  if (ranges.isEmpty || ranges.any((range) => range.isEmpty)) {
    throw ArgumentError("Les plages ne doivent pas être vides");
  }

  var partialResults = <Future<O>>[];

  print("${ranges.length} isolates launched");

  for (var range in ranges) {
    var receivePort = ReceivePort();
    partialResults.add(_spawnIsolate(range, compute, compare, receivePort));
  }

  List<O> results = await Future.wait(partialResults);

  O finalResult = results.reduce(compare);

  return finalResult;
}

Future<O> _spawnIsolate<I, O>(
  Iterable<I> range,
  O Function(I) compute,
  O Function(O, O) compare,
  ReceivePort receivePort,
) async {
  await Isolate.spawn(_isolateFunction<I, O>, receivePort.sendPort);

  var sendPort = await receivePort.first as SendPort;
  var response = ReceivePort();
  sendPort.send([range, compute, compare, response.sendPort]);

  O res = await response.first;

  print("$range => $res");

  return res;
}

void _isolateFunction<I, O>(SendPort mainSendPort) {
  var receivePort = ReceivePort();
  mainSendPort.send(receivePort.sendPort);

  receivePort.listen((message) {
    var range = message[0] as Iterable<I>;
    var compute = message[1] as O Function(I);
    var compare = message[2] as O Function(O, O);
    var replyPort = message[3] as SendPort;

    var iterator = range.iterator;

    if (!iterator.moveNext()) {
      throw StateError("Range cannot be empty");
    }

    O bestResult = compute(iterator.current);

    while (iterator.moveNext()) {
      var currentResult = compute(iterator.current);
      bestResult = compare(bestResult, currentResult);
    }

    replyPort.send(bestResult);
  });
}
