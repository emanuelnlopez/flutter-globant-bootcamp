import 'dart:async';

class CounterState {
  int _counter = 0;

  final StreamController<int> _counterStreamController =
      StreamController<int>.broadcast();

  Stream<int> get counterStream => _counterStreamController.stream;

  void increment() {
    _counter++;
    _counterStreamController.add(_counter);
  }

  void incrementContinuously() async {
    while (true) {
      increment();
      await Future.delayed(
        const Duration(milliseconds: 1500),
      );
    }
  }

  void dispose() {
    _counterStreamController.close();
  }
}
