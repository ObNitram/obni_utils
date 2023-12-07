import "dart:async";
import "dart:io";

extension FutureToSync<T> on Future<T> {
  T toSync() {
    Completer<T> completer = Completer<T>();

    then((value) => completer.complete(value));

    while (!completer.isCompleted) {
      sleep(const Duration(milliseconds: 10));
    }

    return completer.future as T;
  }
}
