import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inherited_widget_samples/src/color_inherited_widget.dart';
import 'package:inherited_widget_samples/src/custom_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  MaterialColor _getRandomColor() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {
    final randomColor = _getRandomColor();
    final mq = MediaQuery.of(context);
    return ColorInheritedWidget(
      color: randomColor,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Screen Size: ${mq.size.width * mq.devicePixelRatio} * ${mq.size.height * mq.devicePixelRatio} ',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Orientation: ${mq.orientation.toString()}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Device Theme: ${mq.platformBrightness.toString()}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                randomColor.value.toRadixString(16).toUpperCase(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const CustomWidget(),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
