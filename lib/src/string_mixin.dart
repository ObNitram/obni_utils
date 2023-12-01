extension Parsing on String {
  int toInt() {
    return double.parse(this).toInt();
  }

  double toDouble() {
    return double.parse(this);
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
}
