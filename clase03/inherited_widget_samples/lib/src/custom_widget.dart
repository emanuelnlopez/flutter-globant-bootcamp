import 'package:flutter/material.dart';
import 'package:inherited_widget_samples/src/color_inherited_widget.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorState = ColorInheritedWidget.of(context);
    return Container(
      color: colorState.color,
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'You have pushed the button this many times:',
        style: TextStyle(
          color: colorState.color[100],
          fontSize: 20.0,
        ),
      ),
    );
  }
}
