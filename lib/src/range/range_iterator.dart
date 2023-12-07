import "package:obni_utils/src/range/range.dart";

class RangeIterator implements Iterator<int> {
  final Range range;
  int _current;

  RangeIterator(this.range) : _current = range.start;

  @override
  int get current => _current;

  @override
  bool moveNext() {
    if (_current < range.end) {
      _current++;
      return true;
    } else {
      return false;
    }
  }

  @override
  String toString() {
    return "$range";
  }
}
