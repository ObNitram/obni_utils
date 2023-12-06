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

extension Divide<T> on List<T> {
  List<List<T>> divide(int divider) {
    if (divider == 0) throw ArgumentError("The divider must not be 0");

    if (divider < 0) throw ArgumentError("The divider must be positive");

    if (length % divider != 0) {
      throw ArgumentError("The list length must be divisible by the divider");
    }

    if (isEmpty) return [[]];

    List<List<T>> newList = [];

    for (var i = 0; i < length; i += divider) {
      newList.add(sublist(i, i + divider));
    }

    return newList;
  }
}
