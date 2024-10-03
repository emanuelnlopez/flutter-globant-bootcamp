import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() => runApp(SemanticsApp());

class SemanticsApp extends StatelessWidget {
  const SemanticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo Semantics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SemanticWidgetsExample(),
    );
  }
}

class SemanticWidgetsExample extends StatefulWidget {
  const SemanticWidgetsExample({super.key});

  @override
  State<SemanticWidgetsExample> createState() => _SemanticWidgetsExampleState();
}

class _SemanticWidgetsExampleState extends State<SemanticWidgetsExample> {
  bool _isOn = false;
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplo Semantics')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Example of Semantics widget with label and hint
            Text(
              'Hola Mundo Semántico!',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: 20.0),

            Semantics(
              label: 'Mensaje de saludo',
              hint: 'Esto es un ejemplo de un texto de saludo',
              child: Text(
                'Hola Mundo Semántico!',
                style: textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 20.0),

            // Example of ExcludeSemantics
            ExcludeSemantics(
              child: Text(
                'Este texto será ignorado.',
                style: textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 20.0),

            // Example of MergeSemantics
            MergeSemantics(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.info,
                    semanticLabel: 'Información Importante',
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      'Este ícono y texto serán leídos en conjunto',
                      style: textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            // Example of Semantic properties on a button
            ElevatedButton(
              onPressed: () {},
              child: const Text('Botón'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            // Example of custom Semantics for a toggle button
            SwitchListTile(
              title: const Text('Interruptor'),
              value: _isOn,
              onChanged: (bool value) {
                setState(() {
                  _isOn = value;
                });
              },
            ),
            const SizedBox(height: 20.0),

            const ListTile(
              subtitle: Text('Subtítulo del elemento de una lista'),
              title: Text('Elemento de una lista'),
              trailing: Icon(Icons.chevron_right),
            ),
            const SizedBox(height: 20.0),

            // Example of Semantics with a slider
            Semantics(
              slider: true,
              value: '${(_sliderValue * 100).round()}%',
              child: Slider(
                value: _sliderValue,
                onChanged: (double value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20.0),

            // Example of OrdinalSortKey for custom traversal order
            Wrap(
              spacing: 8.0,
              children: [
                Semantics(
                  sortKey: const OrdinalSortKey(2),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Segundo'),
                  ),
                ),
                Semantics(
                  sortKey: const OrdinalSortKey(1),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Primero'),
                  ),
                ),
                Semantics(
                  sortKey: const OrdinalSortKey(3),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Tercero'),
                  ),
                ),
              ],
            ),
            Image.network(
              'https://picsum.photos/id/237/300/150',
              semanticLabel: 'Perro de raza Labrador color negro',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          semanticLabel: 'Nuevo mensaje',
        ),
      ),
    );
  }
}
