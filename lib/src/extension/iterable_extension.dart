extension Verify<T> on Iterable<T> {
  bool verify(bool Function(T) foo) {
    for (var element in this) {
      if (!foo(element)) {
        return false;
      }
    }
    return true;
  }
}

extension InfinitIterable<T> on Iterable<T> {
  InfinitIterator<T> get infinitIterator {
    return InfinitIterator(this);
  }
}

class InfinitIterator<T> implements Iterator<T> {
  final Iterable _list;
  int _index = 0;

  InfinitIterator(this._list);

  @override
  T get current => _list.elementAt(_index);

  @override
  bool moveNext() {
    _index = (_index + 1) % _list.length;
    return true;
  }
}
