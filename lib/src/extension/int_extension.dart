extension Between on int {
  bool isBetween(int min, int max) {
    return this >= min && this <= max;
  }

  bool isBetweenExclusive(int min, int max) {
    return this > min && this < max;
  }
}
