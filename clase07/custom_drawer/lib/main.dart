import 'package:flutter/material.dart';
import 'package:custom_drawer/src/custom_drawer/custom_drawer.dart';
import 'package:custom_drawer/src/custom_drawer/custom_guitar_drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool flip = true;
    Widget result;

    if (flip) {
      result = CustomGuitarDrawer(
        child: MyHomePage(appBar: AppBar()),
      );
    } else {
      result = CustomDrawer(
        child: MyHomePage(
          appBar: AppBar(
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => CustomDrawer.of(context).open(),
                );
              },
            ),
            title: const Text('Hello Flutter Europe'),
          ),
        ),
      );
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.blue,
        ),
      ),
      home: result,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final AppBar appBar;

  const MyHomePage({super.key, required this.appBar});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
