extension MapList<K, V> on Map<K, List<V>> {
  List<V> safeGet(K key) {
    return this[key] ??= [];
  }

  void safeAdd(K key, V value) {
    (this[key] ??= []).add(value);
  }

  void safeAddAll(K key, List<V> values) {
    (this[key] ??= []).addAll(values);
  }
}
