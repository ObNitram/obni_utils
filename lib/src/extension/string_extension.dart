extension BasicParsing on String {
  int toInt() {
    return double.parse(this).toInt();
  }

  double toDouble() {
    return double.parse(replaceAll(",", "."));
  }

  bool toBool() {
    if (toLowerCase() == "true") {
      return true;
    }

    try {
      return toDouble() != 0;
    } catch (e) {
      return false;
    }
  }

  bool isInt() {
    try {
      int.parse(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isDouble() {
    try {
      double.parse(this);
      return true;
    } catch (e) {
      return false;
    }
  }
}

extension Find on String {
  int findInt() {
    RegExp exp = RegExp(r"(-?[0-9]+)");

    var matches = exp.allMatches(this).map((e) => e.group(0)!);

    if (matches.isNotEmpty) {
      return matches.first.toInt();
    }

    throw Exception("No int found");
  }

  double findDouble() {
    RegExp exp = RegExp(r"(-?[0-9]*[.,]?[0-9]+)");

    var matches = exp.allMatches(this).map((e) => e.group(0)!);

    if (matches.isNotEmpty) {
      return matches.first.toDouble();
    }

    throw Exception("No double found");
  }
}

extension MultiSpliter on String {
  List<String> splitMulti(List<String> splitStrings) {
    if (splitStrings.isEmpty) {
      return [this];
    }

    String str = this;

    for (String splitString in splitStrings) {
      str = str.replaceAll(splitString, splitStrings.first);
    }

    return str.split(splitStrings.first);
  }
}

extension IterableString on String {
  Iterable<String> get iterable {
    return runes.map((rune) => String.fromCharCode(rune)).toList();
  }
}

extension ToList on String {
  List<int> toListInt([String str = " "]) {
    List<int> intList = [];
    for (var e in split(str)) {
      if (e.isInt()) {
        intList.add(e.toInt());
      }
    }

    return intList;
  }
}

extension InfinitIteratorExtension on String {
  Iterator<String> get infinitIterator {
    return InfinitCharIterator(this);
  }
}

class InfinitCharIterator implements Iterator<String> {
  final String _string;
  int _index = 0;

  InfinitCharIterator(this._string);

  @override
  String get current {
    return _string[_index];
  }

  @override
  bool moveNext() {
    _index = (_index + 1) % _string.length;
    return true;
  }
}
