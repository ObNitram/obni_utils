import "package:obni_utils/src/geo/vec2.dart";
import "package:test/test.dart";

void main() {
  group("Vec2 Tests", () {
    test("Vec2 Function Creates Tuple Correctly", () {
      final v = Vec2(3, 4);
      expect(v, equals(Vec2(3, 4)));
    });

    test("XY Extension Retrieves Correct X and Y Values", () {
      final v = Vec2(5, 6);
      expect(v.x, equals(5));
      expect(v.y, equals(6));
    });

    test("XY Extension Works with Different Values", () {
      final v = Vec2(-1, 10);
      expect(v.x, equals(-1));
      expect(v.y, equals(10));
    });

    test("XY Extension Remains Consistent for Multiple Vec2 Instances", () {
      final v1 = Vec2(7, 8);
      final v2 = Vec2(9, -2);

      expect(v1.x, equals(7));
      expect(v1.y, equals(8));
      expect(v2.x, equals(9));
      expect(v2.y, equals(-2));
    });
  });

  group("Vec2 Operator Extension Tests", () {
    test("Addition Operator", () {
      final v1 = Vec2(1, 2);
      final v2 = Vec2(3, 4);
      expect(v1 + v2, equals(Vec2(4, 6)));
    });

    test("Subtraction Operator", () {
      final v1 = Vec2(5, 7);
      final v2 = Vec2(2, 3);
      expect(v1 - v2, equals(Vec2(3, 4)));
    });

    test("Multiplication Operator", () {
      final v1 = Vec2(2, 3);
      final v2 = Vec2(4, 5);
      expect(v1 * v2, equals(Vec2(8, 15)));
    });

    test("Modulo Operator", () {
      final v1 = Vec2(10, 18);
      final v2 = Vec2(4, 7);
      expect(v1 % v2, equals(Vec2(2, 4)));
    });

    test("Integer Division Operator", () {
      final v1 = Vec2(10, 20);
      final v2 = Vec2(3, 4);
      expect(v1 ~/ v2, equals(Vec2(3, 5)));
    });

    test("Unary Negation Operator", () {
      final v = Vec2(3, -4);
      expect(-v, equals(Vec2(-3, 4)));
    });
  });

  group("Vec2 Operator Extension Edge Cases", () {
    test("Addition with Zero", () {
      final v = Vec2(5, -3);
      final zero = Vec2(0, 0);
      expect(v + zero, equals(v));
    });

    test("Subtraction to Zero", () {
      final v = Vec2(3, 3);
      expect(v - v, equals(Vec2(0, 0)));
    });

    test("Multiplication with Zero", () {
      final v = Vec2(4, -5);
      final zero = Vec2(0, 0);
      expect(v * zero, equals(zero));
    });

    test("Modulo with Zero", () {
      final v = Vec2(15, 25);
      final zero = Vec2(0, 0);
      expect(() => v % zero, throwsA(isA<UnsupportedError>()));
    });

    test("Integer Division by Zero", () {
      final v = Vec2(10, 20);
      final zero = Vec2(0, 0);
      expect(() => v ~/ zero, throwsA(isA<UnsupportedError>()));
    });

    test("Large Number Arithmetic", () {
      final large = Vec2(1000000, 2000000);
      final v = Vec2(1, 1);
      expect(large + v, equals(Vec2(1000001, 2000001)));
      expect(large - v, equals(Vec2(999999, 1999999)));
      expect(large * v, equals(large));
      expect(large ~/ v, equals(large));
    });

    test("Negative Number Arithmetic", () {
      final v1 = Vec2(-3, -4);
      final v2 = Vec2(2, 1);
      expect(v1 + v2, equals(Vec2(-1, -3)));
      expect(v1 - v2, equals(Vec2(-5, -5)));
      expect(v1 * v2, equals(Vec2(-6, -4)));
      expect(v1 ~/ v2, equals(Vec2(-1, -4)));
      expect(v1 % v2, equals(Vec2(1, 0)));
    });
  });

  group("Vec2 Compare Extension Tests", () {
    test("Less Than Operator", () {
      expect(Vec2(1, 2) < Vec2(2, 3), isTrue);
      expect(Vec2(1, 3) < Vec2(1, 4), isTrue);
      expect(Vec2(2, 2) < Vec2(3, 2), isTrue);
      expect(Vec2(2, 3) < Vec2(2, 2), isFalse);
      expect(Vec2(3, 3) < Vec2(3, 3), isFalse);
    });

    test("Double Less Than Operator", () {
      expect(Vec2(1, 2) << Vec2(2, 3), isTrue);
      expect(Vec2(1, 3) << Vec2(1, 4), isFalse);
      expect(Vec2(2, 2) << Vec2(3, 2), isFalse);
    });

    test("Less Than or Equal Operator", () {
      expect(Vec2(2, 2) <= Vec2(2, 2), isTrue);
      expect(Vec2(1, 2) <= Vec2(2, 3), isTrue);
      expect(Vec2(2, 3) <= Vec2(2, 2), isFalse);
    });

    test("Greater Than Operator", () {
      expect(Vec2(3, 4) > Vec2(2, 3), isTrue);
      expect(Vec2(3, 3) > Vec2(3, 2), isTrue);
      expect(Vec2(2, 4) > Vec2(2, 4), isFalse);
      expect(Vec2(2, 3) > Vec2(3, 3), isFalse);
    });

    test("Double Greater Than Operator", () {
      expect(Vec2(3, 4) >> Vec2(2, 3), isTrue);
      expect(Vec2(3, 3) >> Vec2(3, 3), isFalse);
      expect(Vec2(2, 4) >> Vec2(2, 4), isFalse);
    });

    test("Greater Than or Equal Operator", () {
      expect(Vec2(3, 3) >= Vec2(3, 3), isTrue);
      expect(Vec2(4, 5) >= Vec2(3, 4), isTrue);
      expect(Vec2(2, 3) >= Vec2(3, 3), isFalse);
    });
  });
}
