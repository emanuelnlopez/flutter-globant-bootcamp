import 'package:flutter/material.dart';

class ExplicitAnimationsScreen extends StatefulWidget {
  const ExplicitAnimationsScreen({super.key});

  @override
  State<ExplicitAnimationsScreen> createState() =>
      _ExplicitAnimationsScreenState();
}

class _ExplicitAnimationsScreenState extends State<ExplicitAnimationsScreen>
    with SingleTickerProviderStateMixin {
  bool _toggle = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    ///
    /// Inicializando AnimationController
    ///
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    ///
    /// Animaciones
    ///
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.5,
    ).animate(_controller);

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.14159,
    ).animate(_controller);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(1, 0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimations() {
    setState(() {
      _toggle = !_toggle;
      if (_toggle) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Animaciones Explícitas')),
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
                    /// FadeTransition
                    ///
                    Text('FadeTransition', style: textTheme.titleLarge),
                    Text(
                      'Anima la opacidad de un widget.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10.0),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        color: Colors.blue,
                        height: 100,
                        width: 100,
                        child: const Center(child: Text('Fade')),
                      ),
                    ),
                    const SizedBox(height: 30.0),

                    ///
                    /// ScaleTransition
                    ///
                    Text('ScaleTransition', style: textTheme.titleLarge),
                    Text(
                      'Anima el escalado de un widget.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10.0),
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        color: Colors.green,
                        height: 100.0,
                        width: 100.0,
                        child: const Center(child: Text('Scale')),
                      ),
                    ),
                    const SizedBox(height: 30.0),

                    ///
                    /// RotationTransition
                    ///
                    Text('RotationTransition', style: textTheme.titleLarge),
                    Text(
                      'Anima la rotación de un widget.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10.0),
                    RotationTransition(
                      turns: _rotationAnimation,
                      child: Container(
                        color: Colors.orange,
                        height: 100.0,
                        width: 100.0,
                        child: const Center(child: Text('Rotación')),
                      ),
                    ),
                    const SizedBox(height: 30.0),

                    ///
                    /// SlideTransition
                    ///
                    Text('SlideTransition', style: textTheme.titleLarge),
                    Text(
                      'Anima la posición de un widget deslizándose de un lugar a otro.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10.0),
                    SlideTransition(
                      position: _slideAnimation,
                      child: Container(
                        color: Colors.red,
                        height: 100.0,
                        width: 100.0,
                        child: const Center(child: Text('Deslizar')),
                      ),
                    ),
                    const SizedBox(height: 30.0),

                    ///
                    /// PositionedTransition
                    ///
                    Text('PositionedTransition', style: textTheme.titleLarge),
                    Text(
                      'Anima la posición de un widget dentro de un Stack.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      height: 200,
                      color: Colors.grey.withOpacity(0.3),
                      child: Stack(
                        children: [
                          PositionedTransition(
                            rect: RelativeRectTween(
                              begin: const RelativeRect.fromLTRB(
                                10.0,
                                10.0,
                                50.0,
                                50.0,
                              ),
                              end: const RelativeRect.fromLTRB(
                                150.0,
                                150.0,
                                10.0,
                                10.0,
                              ),
                            ).animate(_controller),
                            child: Container(
                              color: Colors.purple,
                              height: 50.0,
                              width: 50.0,
                              child: const Center(child: Text('Posición')),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _toggleAnimations,
                  child: Text(_toggle ? 'DETENER!' : 'ANIMAR!'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
