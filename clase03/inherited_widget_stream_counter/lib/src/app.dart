import 'package:flutter/material.dart';
import 'package:inherited_widget_stream_counter/src/counter_inherited_widget.dart';
import 'package:inherited_widget_stream_counter/src/counter_state.dart';
import 'package:inherited_widget_stream_counter/src/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return CounterInheritedWidget(
      counterState: CounterState(),
      child: MaterialApp(
        title: 'Flutter Counter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(title: 'Flutter Counter App'),
      ),
    );
  }
}
