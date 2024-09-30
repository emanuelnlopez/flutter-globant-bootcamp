import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  var _toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Center(
              child: AnimatedContainer(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _toggle ? Colors.red : Colors.blue,
                  borderRadius: _toggle
                      ? BorderRadius.circular(30.0)
                      : BorderRadius.circular(0.0),
                ),
                duration: const Duration(seconds: 1),
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
                child: const Text(
                  'Modificar propiedades del AnimatedContainer!',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
