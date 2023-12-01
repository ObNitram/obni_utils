import "package:obni_utils/obni_utils.dart";
import "package:test/test.dart";

void main() {
  group("Parsing", () {
    test("to int", () {
      expect("1".toInt(), equals(1));
      expect("+1".toInt(), equals(1));
      expect("-1".toInt(), equals(-1));
      expect("0".toInt(), equals(0));

      expect("1.0".toInt(), equals(1));
      expect("1.9".toInt(), equals(1));

      expect("-1.0".toInt(), equals(-1));
      expect("-1.9".toInt(), equals(-1));

      expect(() => "a".toInt(), throwsException);
    });

    test("to double", () {
      expect("1".toDouble(), equals(1.0));
      expect("+1".toDouble(), equals(1.0));
      expect("-1".toDouble(), equals(-1.0));
      expect("0".toDouble(), equals(0.0));

      expect("1.0".toDouble(), equals(1.0));
      expect("1.9".toDouble(), equals(1.9));

      expect("-1.0".toDouble(), equals(-1.0));
      expect("-1.9".toDouble(), equals(-1.9));

      expect(() => "a".toDouble(), throwsException);
    });

    test("to bool", () {
      expect("true".toBool(), equals(true));
      expect("false".toBool(), equals(false));
      expect("1".toBool(), equals(true));
      expect("0".toBool(), equals(false));
      expect("2".toBool(), equals(true));
      expect("-1".toBool(), equals(true));
      expect("1.0".toBool(), equals(true));
      expect("0.0".toBool(), equals(false));
      expect("2.0".toBool(), equals(true));
      expect("-1.0".toBool(), equals(true));
      expect("a".toBool(), equals(false));
    });
  });
}
