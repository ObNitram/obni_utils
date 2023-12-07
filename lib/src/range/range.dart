import "package:obni_utils/src/range/range_iterator.dart";

class Range extends Iterable<int> {
  int start, end;

  @override
  int get length => end - start;

  int get indexFirst => start;

  int get indexLast => end - 1;

  Range(this.start, this.end) : assert(start <= end);

  Range.fromLength(this.start, int length)
      : assert(length >= 0),
        end = start + length;

  Range.sur(int start, int end)
      : start = start < end ? start : end,
        end = start < end ? end : start;

  Range.fromList(List<int> list)
      : assert(list.length == 2),
        start = list[0],
        end = list[1];

  bool containInt(int value) {
    return value >= start && value < end;
  }

  bool containRange(Range range) {
    return range.start >= start && range.end <= end;
  }

  List<Range> split(int count) {
    List<Range> result = [];
    int step = length ~/ count;
    int current = start;
    for (var i = 0; i < count; ++i) {
      result.add(Range.fromLength(current, step));
      current += step;
    }
    result.last.end = end;
    return result;
  }

  List<Range> splitByLength(int length) {
    List<Range> result = [];
    int current = start;
    while (current < end) {
      result.add(Range.fromLength(current, length));
      current += length;
    }
    result.last.end = end;
    return result;
  }

  @override
  Iterator<int> get iterator => RangeIterator(this);

  @override
  String toString() {
    return "[$start..$end[";
  }
}
