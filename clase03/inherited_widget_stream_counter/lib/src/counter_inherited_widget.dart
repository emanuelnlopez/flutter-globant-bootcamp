import 'package:flutter/material.dart';
import 'package:inherited_widget_stream_counter/src/counter_state.dart';

class CounterInheritedWidget extends InheritedWidget {
  const CounterInheritedWidget({
    required this.counterState,
    super.key,
    required super.child,
  });

  static CounterInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>()!;

  final CounterState counterState;

  /// Whether the framework should notify widgets that inherit from this widget.
  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) => true;
}
