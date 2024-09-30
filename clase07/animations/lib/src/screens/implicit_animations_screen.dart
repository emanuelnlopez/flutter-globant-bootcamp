import 'package:flutter/material.dart';

class ImplicitAnimationsScreen extends StatefulWidget {
  const ImplicitAnimationsScreen({super.key});

  @override
  State<ImplicitAnimationsScreen> createState() =>
      _ImplicitAnimationsScreenState();
}

class _ImplicitAnimationsScreenState extends State<ImplicitAnimationsScreen> {
  bool _toggle = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Animaciones Implícitas')),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///
                    /// AnimatedContainer
                    ///
                    Text('AnimatedContainer', style: textTheme.titleLarge),
                    Text(
                      'Anima cambios en propiedades del contenedor',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10.0),
                    AnimatedContainer(
                      alignment: _toggle ? Alignment.center : Alignment.topLeft,
                      color: _toggle ? Colors.blue : Colors.red,
                      duration: const Duration(seconds: 1),
                      height: 100.0,
                      width: _toggle ? 200.0 : 100.0,
                      child: const Text('Toca para animar'),
                    ),
                    const SizedBox(height: 30.0),

                    ///
                    /// AnimatedOpacity
                    ///
                    Text('AnimatedOpacity', style: textTheme.titleLarge),
                    Text(
                      'Anima la opacidad de un widget para hacerlo aparecer o desaparecer.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10.0),
                    AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      opacity: _toggle ? 1.0 : 0.0,
                      child: Container(
                        color: Colors.green,
                        height: 100.0,
                        width: 100.0,
                        child: const Center(child: Text('Opacidad')),
                      ),
                    ),
                    const SizedBox(height: 30.0),

                    ///
                    /// AnimatedAlign
                    ///
                    Text('AnimatedAlign', style: textTheme.titleLarge),
                    Text(
                      'Anima la alineación de un widget.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      height: 100.0,
                      color: Colors.yellowAccent,
                      child: AnimatedAlign(
                        alignment:
                            _toggle ? Alignment.topRight : Alignment.bottomLeft,
                        duration: const Duration(seconds: 1),
                        child: Container(
                          color: Colors.purple,
                          height: 50.0,
                          width: 50.0,
                          child: const Center(child: Text('Align')),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),

                    ///
                    /// AnimatedPositioned
                    ///
                    Text('AnimatedPositioned', style: textTheme.titleLarge),
                    Text(
                      'Anima la posición de un widget dentro de un Stack.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: 200.0,
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: const Duration(seconds: 1),
                            left: _toggle ? 150 : 20,
                            top: _toggle ? 50 : 150,
                            child: Container(
                              color: Colors.orange,
                              height: 50.0,
                              width: 50.0,
                              child: const Center(child: Text('Posición')),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0),

                    ///
                    /// AnimatedCrossFade
                    ///
                    Text('AnimatedCrossFade', style: textTheme.titleLarge),
                    Text(
                      'Anima la transición entre dos widgets mediante un efecto de desvanecimiento.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10.0),
                    AnimatedCrossFade(
                      duration: const Duration(seconds: 1),
                      firstChild: Container(
                        color: Colors.teal,
                        height: 100.0,
                        width: 100.0,
                        child: const Center(child: Text('Primero')),
                      ),
                      secondChild: Container(
                        color: Colors.pink,
                        height: 100.0,
                        width: 100.0,
                        child: const Center(child: Text('Segundo')),
                      ),
                      crossFadeState: _toggle
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                    ),
                    const SizedBox(height: 30.0),

                    ///
                    /// AnimatedDefaultTextStyle
                    ///
                    Text(
                      'AnimatedDefaultTextStyle',
                      style: textTheme.titleLarge,
                    ),
                    Text(
                      'Anima las propiedades de estilo de texto.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10.0),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(seconds: 1),
                      style: _toggle
                          ? const TextStyle(
                              color: Colors.red,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            )
                          : const TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                            ),
                      child: const Text('Texto animado'),
                    ),
                    const SizedBox(height: 30.0),

                    ///
                    /// AnimatedSize
                    ///
                    Text('AnimatedSize', style: textTheme.titleLarge),
                    Text(
                      'Anima los cambios de tamaño de un widget.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10.0),
                    AnimatedSize(
                      duration: const Duration(seconds: 1),
                      child: Container(
                        color: Colors.lightBlue,
                        height: _toggle ? 100.0 : 200.0,
                        width: _toggle ? 200.0 : 100.0,
                        child: const Center(child: Text('Tamaño')),
                      ),
                    ),
                    const SizedBox(height: 30.0),

                    ///
                    /// AnimatedSwitcher
                    ///
                    Text('AnimatedSwitcher', style: textTheme.titleLarge),
                    Text(
                      'Cambia entre dos widgets con un efecto de desvanecimiento o transición.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10.0),
                    AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      child: _toggle
                          ? Container(
                              color: Colors.deepPurple,
                              height: 100.0,
                              key: const ValueKey(1),
                              width: 100.0,
                              child: const Center(child: Text('Vista 1')),
                            )
                          : Container(
                              color: Colors.deepOrange,
                              height: 100.0,
                              key: const ValueKey(2),
                              width: 100.0,
                              child: const Center(child: Text('Vista 2')),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => setState(() => _toggle = !_toggle),
                  child: const Text('ANIMAR!'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
