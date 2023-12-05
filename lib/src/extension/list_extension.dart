extension Sum<T extends num> on List<T> {
  T sum() {
    return fold(0 as T, (currentSum, element) => (currentSum + element) as T);
  }
}

extension Concat on List<String> {
  String concat() {
    return fold("", (currentString, element) => currentString + element);
  }
}
