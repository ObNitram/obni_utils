import "package:obni_utils/src/geo/range.dart";
import "package:test/test.dart";

void main() {
  group("Range Class Tests", () {
    late Range range;

    setUp(() {
      // Initialize range before each test
      range = Range(5, 10);
    });

    test("Range length calculation", () {
      expect(Range(0, 0).length, equals(0));
      expect(Range(0, 1).length, equals(1));
      expect(Range(0, 5).length, equals(5));
      expect(Range(0, 10).length, equals(10));
      expect(Range(2, 14).length, equals(12));
      expect(Range(10, 10).length, equals(0));
    });

    test("Checking if an integer is within the range", () {
      expect(range.containInt(5), isTrue);
      expect(range.containInt(4), isFalse);
      expect(range.containInt(9), isTrue);
      expect(range.containInt(10), isFalse); // 10 is not inclusive
    });

    test("Checking if another Range is within the range", () {
      Range subRange = Range(6, 9);
      Range outRange = Range(3, 7);
      expect(range.containRange(subRange), isTrue);
      expect(range.containRange(outRange), isFalse);
    });
  });

  group("RangeOnList Extension Tests", () {
    late List<int> list;

    setUp(() {
      // Initialize list before each test
      list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    });

    test("Getting a sub-list from a list based on a range", () {
      expect(list.getRangeByRange(Range(0, 0)), equals([]));
      expect(list.getRangeByRange(Range(0, 10)),
          equals([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]));

      var range = list.getRangeByRange(Range(3, 7));
      var expected = [4, 5, 6, 7];
      expect(range, equals(expected));
    });
  });
}
