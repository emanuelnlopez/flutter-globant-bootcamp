import 'package:flutter/material.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  var _toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _toggle ? Colors.red : Colors.blue,
                  borderRadius: _toggle
                      ? BorderRadius.circular(30.0)
                      : BorderRadius.circular(0.0),
                ),
                height: _toggle ? 300.0 : 100.0,
                width: _toggle ? 300.0 : 100.0,
                child: Text(
                  _toggle ? 'Hola Mundo!' : 'Adiós Mundo',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => setState(() => _toggle = !_toggle),
                child: const Text('Modificar propiedades del Container!'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
