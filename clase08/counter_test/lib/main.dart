import 'package:counter_test/src/presentation/presentation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CounterTestApp());

class CounterTestApp extends StatelessWidget {
  const CounterTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IndexScreen(),
    );
  }
}
