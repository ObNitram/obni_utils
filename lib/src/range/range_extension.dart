import "package:obni_utils/src/range/range.dart";

extension RangeOnList<T> on List<T> {
  Iterable<T> getRangeByRange(Range range) {
    return getRange(range.start, range.end);
  }
}

extension IsIn on int {
  bool isIn(Range range) {
    return range.containInt(this);
  }
}
