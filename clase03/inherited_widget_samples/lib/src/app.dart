import 'package:flutter/material.dart';
import 'package:inherited_widget_samples/src/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Inherited Widget Demo',
      home: HomePage(title: 'Inherited Widget demo'),
    );
  }
}
