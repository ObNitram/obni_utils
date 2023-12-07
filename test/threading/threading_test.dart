import "dart:math";

import "package:obni_utils/src/range/range.dart";
import "package:obni_utils/src/threading/threading.dart";

Future<void> main() async {
  List<Iterable<int>> ranges = [
    Range(0, 999999999999999999),
    Range(0, 999999999999999999),
    Range(0, 999999999999999999),
    Range(0, 999999999999999999),
    Range(0, 999999999999999999),
    Range(0, 99999999),
    Range(0, 99999999),
    Range(0, 99999999),
    Range(0, 99999999),
  ];

  int res = await computeThreading<int, int>(
    (p0, p1) => max(p0, p1),
    (p0) => p0 + 1,
    ranges,
  );

  print(res);
}
