class Range {
  int start, end;

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

  List<int> toList() {
    return [start, end];
  }

  bool containInt(int value) {
    return value >= start && value < end;
  }

  bool containRange(Range range) {
    return range.start >= start && range.end <= end;
  }
}

extension RangeOnList<T> on List<T> {
  Iterable<T> getRangeByRange(Range range) {
    return getRange(range.start, range.end);
  }
}
