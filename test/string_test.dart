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

  group("findDouble tests", () {
    test("Should find a double in a string with one double", () {
      String str = "The number is 123.45 in the text";
      expect(str.findDouble(), equals(123.45));
    });

    test("Should find a double with comma as decimal separator", () {
      String str = "Amount: 678,90 euros";
      expect(str.findDouble(), equals(678.90));
    });

    test("Should handle string with integer", () {
      String str = "There are 500 apples";
      expect(str.findDouble(), equals(500.0));
    });

    test("Should throw Exception when no double is present", () {
      String str = "No numbers here";
      expect(() => str.findDouble(), throwsException);
    });

    test("Should find the first double when multiple doubles are present", () {
      String str = "Numbers 10.5 and 20.6 are here";
      expect(str.findDouble(), equals(10.5));
    });

    test("Should handle double at the start of a string", () {
      String str = "42 is the answer";
      expect(str.findDouble(), equals(42.0));
    });

    test("Should handle double at the end of a string", () {
      String str = "The answer is 42";
      expect(str.findDouble(), equals(42.0));
    });

    test("Should handle string with only a decimal point", () {
      String str = "Value is .75";
      expect(str.findDouble(), equals(0.75));
    });

    test("Should handle string with leading zeros", () {
      String str = "Amount is 000123.45";
      expect(str.findDouble(), equals(123.45));
    });

    test("Should handle string with a double having no integer part", () {
      String str = ".25 of the total";
      expect(str.findDouble(), equals(0.25));
    });

    test("Should handle string with a double having no decimal part", () {
      String str = "123.";
      expect(str.findDouble(), equals(123.0));
    });

    test(
        "Should find the first double in a string resembling a dotted IP address",
        () {
      String str = "IP is 192.168.0.1";
      expect(str.findDouble(), equals(192.168));
    });

    test("Should handle string with double having trailing zeros", () {
      String str = "Total is 123.45000";
      expect(str.findDouble(), equals(123.45));
    });

    test("Should find the double even when it is followed by another digit",
        () {
      String str = "The number is 123.4567.";
      expect(str.findDouble(), equals(123.4567));
    });

    test("Should correctly identify a negative double value in a string", () {
      String str = "Temperature is -12.34 degrees";
      expect(str.findDouble(), equals(-12.34));
    });

    test("Should find a double with comma and no space after comma", () {
      String str = "The weight is 10,5kg";
      expect(str.findDouble(), equals(10.5));
    });
  });

  group("findInt tests", () {
    test("Should find an integer in a string with one integer", () {
      String str = "The number is 123 in the text";
      expect(str.findInt(), equals(123));
    });

    test("Should correctly identify a negative integer in a string", () {
      String str = "Temperature is -20 degrees";
      expect(str.findInt(), equals(-20));
    });

    test("Should throw an exception when no integers are present in the string",
        () {
      String str = "No numbers here";
      expect(() => str.findInt(), throwsException);
    });

    test(
        "Should find the first integer when multiple integers are present in the string",
        () {
      String str = "Numbers 10 and 20 are here";
      expect(str.findInt(), equals(10));
    });

    test("Should correctly find an integer at the start of a string", () {
      String str = "42 is the answer";
      expect(str.findInt(), equals(42));
    });

    test("Should correctly find an integer at the end of a string", () {
      String str = "The answer is 42";
      expect(str.findInt(), equals(42));
    });

    test("Should correctly handle an integer with leading zeros in a string",
        () {
      String str = "Number is 000123";
      expect(str.findInt(), equals(123));
    });

    test(
        "Should find the first integer in a string resembling a dotted IP address",
        () {
      String str = "IP is 192.168.0.1";
      expect(str.findInt(), equals(192));
    });

    test(
        "Should find the integer even when it is followed by non-integer characters in the string",
        () {
      String str = "The number is 123abc";
      expect(str.findInt(), equals(123));
    });

    test("Should correctly identify zero as an integer in a string", () {
      String str = "There are 0 apples";
      expect(str.findInt(), equals(0));
    });
  });

  group("splitMulti tests", () {
    test("Should split string using multiple delimiters", () {
      String str = "apple-banana/orange,pear";
      expect(str.splitMulti(["-", "/", ","]),
          equals(["apple", "banana", "orange", "pear"]));
    });

    test("Should handle empty delimiters list", () {
      String str = "apple banana orange pear";
      expect(
        str.splitMulti([]),
        equals([str]),
      ); // Entire string as a single element
    });

    test("Should handle a single delimiter", () {
      String str = "apple,banana,orange,pear";
      expect(
          str.splitMulti([","]), equals(["apple", "banana", "orange", "pear"]));
    });

    test("Should handle repeated delimiters", () {
      String str = "apple--banana,,orange//pear";
      expect(str.splitMulti(["-", ","]),
          equals(["apple", "", "banana", "", "orange//pear"]));
    });

    test("Should handle delimiters at the start and end of string", () {
      String str = "-apple,banana,orange,pear-";
      expect(str.splitMulti(["-", ","]),
          equals(["", "apple", "banana", "orange", "pear", ""]));
    });

    test("Should handle case where delimiter is not present", () {
      String str = "apple banana orange pear";
      expect(str.splitMulti(["x"]),
          equals([str])); // Entire string as a single element
    });

    test("Should handle string with overlapping delimiters", () {
      String str = "apple-,-banana,-orange,-pear";
      expect(str.splitMulti(["-", ","]),
          equals(["apple", "", "", "banana", "", "orange", "", "pear"]));
    });

    test("Should handle multiple delimiters with different lengths", () {
      String str = "apple--banana::orange;;pear";
      expect(str.splitMulti(["--", "::", ";;"]),
          equals(["apple", "banana", "orange", "pear"]));
    });

    test("Should handle delimiters that are substrings of each other", () {
      String str = "apple-endbanana-endendorange-endendendpear";
      expect(str.splitMulti(["end", "endend", "endendend"]),
          equals(["apple-", "banana-", "orange-", "", "pear"]));
    });

    test("Should handle delimiters that are substrings of each other", () {
      String str = "apple-endbanana-endendorange-endendendpear";
      expect(str.splitMulti(["endendend", "endend", "end"]),
          equals(["apple-", "banana-", "", "", "orange-", "", "", "", "pear"]));
    });
  });

  group("Tests for IterableString extension", () {
    test("Empty string should return an empty iterable", () {
      String emptyString = "";
      expect(emptyString.iterable, isEmpty);
    });

    test("String with single character should return iterable with one element",
        () {
      String singleCharString = "a";
      expect(singleCharString.iterable, equals(["a"]));
    });

    test("String with special characters should be correctly iterable", () {
      String specialCharString = "😊🚀";
      expect(specialCharString.iterable, equals(["😊", "🚀"]));
    }, skip: "Split don't handle special characters");

    test("Long string should be correctly split into iterable", () {
      String longString = "Hello, World!";
      expect(
          longString.iterable,
          equals([
            "H",
            "e",
            "l",
            "l",
            "o",
            ",",
            " ",
            "W",
            "o",
            "r",
            "l",
            "d",
            "!"
          ]));
    });

    test("Iterating over a string should give individual characters", () {
      String testString = "test";
      List<String> characters = [];
      for (var char in testString.iterable) {
        characters.add(char);
      }
      expect(characters, equals(["t", "e", "s", "t"]));
    });
  });
}
