import "package:obni_utils/src/geo/matrix.dart";
import "package:test/test.dart";

void main() {
  group("Matrix2.fromString Tests", () {
    test("Creates Matrix from String with Custom Separators", () {
      String data = "1,2,3;4,5,6;7,8,9";
      var matrix = Matrix2.fromString(data, ";", ",");

      expect(
          matrix.data,
          equals([
            ["1", "2", "3"],
            ["4", "5", "6"],
            ["7", "8", "9"]
          ]));
    });

    test("Handles Empty String", () {
      String data = "";
      var matrix = Matrix2.fromString(data, ";", ",");

      expect(
          matrix.data,
          equals(
            [
              [""]
            ],
          ));
    });

    test("Handles Single Row", () {
      String data = "1,2,3";
      var matrix = Matrix2.fromString(data, ";", ",");

      expect(
          matrix.data,
          equals([
            ["1", "2", "3"]
          ]));
    });

    test("Handles Uneven Rows", () {
      String data = "1,2;3,4,5;6";
      var matrix = Matrix2.fromString(data, ";", ",");

      expect(() => matrix.data, throwsArgumentError);
    });

    test("Works with Different Separators", () {
      String data = "1 2|3 4";
      var matrix = Matrix2.fromString(data, "|", " ");

      expect(
          matrix.data,
          equals([
            ["1", "2"],
            ["3", "4"]
          ]));
    });

    // Add more tests if needed for other edge cases or scenarios
  });
}
