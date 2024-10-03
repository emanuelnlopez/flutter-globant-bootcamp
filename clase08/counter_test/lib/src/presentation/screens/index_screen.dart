import 'package:counter_test/src/data/data.dart';
import 'package:counter_test/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter testing')),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CounterScreen()),
            ),
            subtitle: const Text('El contador clásico de Flutter'),
            title: const Text('Contador'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AlbumScreen(
                  repository: HttpAlbumRepository(
                    client: Client(),
                  ),
                ),
              ),
            ),
            subtitle: const Text(
              'Realiza una llamada GET y muestra el resultado',
            ),
            title: const Text('Album'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TestingScreen(
                  title: 'Screen title',
                  message: 'Screen message',
                ),
              ),
            ),
            subtitle: const Text(
              'Pantalla que muestra el titulo y mensaje pasado por parámetro',
            ),
            title: const Text('Pantalla utilizada en Widget test'),
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      )),
    );
  }
}
