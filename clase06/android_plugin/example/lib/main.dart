import 'package:android_plugin_example/src/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PluginExampleApp());

class PluginExampleApp extends StatelessWidget {
  const PluginExampleApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(home: HomeScreen());
}
