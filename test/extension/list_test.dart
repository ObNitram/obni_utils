import "package:obni_utils/src/extension/list_extension.dart";
import "package:obni_utils/src/extension/map_extension.dart";
import "package:test/test.dart";

void main() {
  group("MapList Extension Tests", () {
    test("safeGet returns existing list for a key", () {
      var map = <String, List<int>>{
        "existingKey": [1, 2, 3]
      };

      expect(map.safeGet("existingKey"), equals([1, 2, 3]));
    });

    test("safeGet creates and returns a new list for a non-existing key", () {
      var map = <String, List<int>>{};

      expect(map.safeGet("newKey"), isEmpty);
      expect(map.containsKey("newKey"), isTrue);
    });

    test("safeAdd adds a value to the list of an existing key", () {
      var map = <String, List<int>>{
        "existingKey": [1, 2]
      };

      map.safeAdd("existingKey", 3);
      expect(map["existingKey"], equals([1, 2, 3]));
    });

    test("safeAdd creates a new list and adds a value for a non-existing key",
        () {
      var map = <String, List<int>>{};

      map.safeAdd("newKey", 42);
      expect(map["newKey"], equals([42]));
    });

    test("safeAddAll adds multiple values to the list of an existing key", () {
      var map = <String, List<int>>{
        "existingKey": [1, 2]
      };

      map.safeAddAll("existingKey", [3, 4]);
      expect(map["existingKey"], equals([1, 2, 3, 4]));
    });

    test(
        "safeAddAll creates a new list and adds multiple values for a non-existing key",
        () {
      var map = <String, List<int>>{};

      map.safeAddAll("newKey", [42, 43]);
      expect(map["newKey"], equals([42, 43]));
    });
  });

  group("List Dive", () {
    test("divide divides a list into sublists of equal length", () {
      var list = [1, 2, 3, 4, 5, 6];
      var dividedList = list.divide(2);

      expect(
          dividedList,
          equals([
            [1, 2],
            [3, 4],
            [5, 6]
          ]));
    });

    test(
        "divide throws an ArgumentError if the list length is not divisible by the divider",
        () {
      var list = [1, 2, 3, 4, 5, 6];

      expect(
          list.divide(3),
          equals([
            [1, 2, 3],
            [4, 5, 6]
          ]));
    });

    test(
        "divide throws an ArgumentError if the list length is not divisible by the divider",
        () {
      var list = [1, 2, 3, 4, 5, 6];

      expect(() => list.divide(4), throwsArgumentError);
    });

    test(
        "divide throws an ArgumentError if the list length is not divisible by the divider",
        () {
      var list = [1, 2, 3, 4, 5, 6];

      expect(() => list.divide(12), throwsArgumentError);
    });

    test(
        "divide throws an ArgumentError if the list length is not divisible by the divider",
        () {
      var list = [1, 2, 3, 4, 5, 6, 7];

      expect(() => list.divide(2), throwsArgumentError);
    });

    test(
        "divide throws an ArgumentError if the list length is not divisible by the divider",
        () {
      var list = [1, 2, 3, 4, 5, 6, 7];

      expect(() => list.divide(0), throwsArgumentError);
    });

    test("list can be empty", () {
      var list = <int>[];
      expect(list.divide(2), equals([[]]));
    });
  });
}
