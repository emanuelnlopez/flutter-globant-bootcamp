import 'package:bootcamp/src/layout_demo_screen.dart';
import 'package:bootcamp/src/my_home_page.dart';
import 'package:bootcamp/src/widget_demo_screen.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  void _navigateTo(BuildContext context, {required Widget destination}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Globant Flutter Bootcamp'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 16.0,
          top: 16.0,
        ),
        child: Column(
          children: [
            ListTile(
              title: Text('Hola Mundo Flutter'),
              subtitle: Text('Ejemplo por defecto de una app Flutter'),
              trailing: Icon(Icons.chevron_right),
              onTap: () => _navigateTo(
                context,
                destination: MyHomePage(title: 'Flutter Demo Home Page'),
              ),
            ),
            ListTile(
              title: Text('Ejemplos widgets'),
              subtitle: Text('Ejemplo de varios widgets Flutter'),
              trailing: Icon(Icons.chevron_right),
              onTap: () => _navigateTo(
                context,
                destination: WidgetDemoScreen(title: 'Widgets Demo Screen'),
              ),
            ),
            ListTile(
              title: Text('Ejemplo layout'),
              subtitle: Text('Ejemplo de una diseño de una pantalla'),
              trailing: Icon(Icons.chevron_right),
              onTap: () => _navigateTo(
                context,
                destination: LayoutDemoScreen(title: 'Layout Demo Screen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
