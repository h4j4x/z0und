extension IterableUtils<E> on Iterable<E> {
  int indexOf(E element, [int start = 0]) =>
      toList(growable: false).indexOf(element, start);
}

extension MapUtils<K, V> on Map<K, V> {
  int indexOfValue(V? value) => value != null ? values.indexOf(value) : -1;
}
