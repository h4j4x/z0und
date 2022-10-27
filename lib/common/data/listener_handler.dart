typedef EventListener<T> = Function(T);

mixin ListenerHandler<T> {
  final _listeners = <EventListener<T>>{};

  void addListener(EventListener<T> listener) {
    _listeners.add(listener);
  }

  void removeListener(EventListener<T> listener) {
    _listeners.remove(listener);
  }

  void notifyListeners(T event) {
    for (EventListener<T> listener in _listeners) {
      listener(event);
    }
  }
}
