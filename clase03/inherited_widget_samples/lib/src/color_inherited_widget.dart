import 'package:flutter/material.dart';

class ColorInheritedWidget extends InheritedWidget {
  const ColorInheritedWidget({
    required this.color,
    super.key,
    required super.child,
  });

  static ColorInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ColorInheritedWidget>()!;

  final MaterialColor color;

  /// Whether the framework should notify widgets that inherit from this widget.
  @override
  bool updateShouldNotify(ColorInheritedWidget oldWidget) =>
      oldWidget.color.value != color.value;
}
