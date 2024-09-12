import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

///
/// Catálogo de widgets
/// https://docs.flutter.dev/reference/widgets
///
class WidgetDemoScreen extends StatelessWidget {
  WidgetDemoScreen({
    super.key,
    required this.title,
  });

  final logger = Logger('WidgetDemoScreen');
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 100.0,
              width: 100.0,
              child: Placeholder(),
            ),
            SizedBox(height: 20.0),
            Text(
              'Hola, Flutter!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              color: Colors.red,
              height: 100.0,
              width: 100.0,
              child: Center(child: Text('Contenedor')),
            ),
            SizedBox(height: 20.0),
            Text('Primera linea'),
            SizedBox(height: 10.0),
            Text('Segunda linea'),
            SizedBox(height: 10.0),
            Text('Tercer linea'),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(Icons.accessibility_new, color: Colors.yellow),
                Icon(Icons.favorite, color: Colors.red),
                IconButton(
                  onPressed: () {
                    /// Lint rule warning: avoid_print
                    logger.finest('IconButton pressed!');
                  },
                  icon: Icon(Icons.thumb_up, color: Colors.blue),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                /// Lint rule warning: avoid_print
                logger.finest('ElevatedButton pressed');
              },
              child: Text('Click me!'),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                /// Lint rule warning: avoid_print
                logger.finest('GestureDetector pressed');
              },
              child: Image.network(
                'https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png',
              ),
            ),
            SizedBox(height: 20.0),
            ListTile(
              // leading: Icon(Icons.alarm),
              title: Text('Título'),
              // subtitle: Text('Subtitulo'),
              // trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                /// Lint rule warning: avoid_print
                logger.finest('InkWell pressed');
              },
              child: Image.asset('assets/images/dashatars.png'),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Ingrese su nombre',
              ),
            ),
            SizedBox(height: 20.0),
            Stack(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Text(
                    'Encima!',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
