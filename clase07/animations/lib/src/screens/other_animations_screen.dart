import 'package:animations/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OtherAnimationsScreen extends StatefulWidget {
  const OtherAnimationsScreen({super.key});

  @override
  State<OtherAnimationsScreen> createState() => _OtherAnimationsScreenState();
}

class _OtherAnimationsScreenState extends State<OtherAnimationsScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Otras animaciones')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///
            /// Hero
            ///
            Text('Hero', style: textTheme.titleLarge),
            Text(
              'Anima la transición de un widget entre dos pantallas',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(Routes.heroDetail),
              child: Hero(
                tag: 'hero-animation',
                child: Container(
                  color: Colors.red,
                  height: 100.0,
                  width: 100.0,
                  child: const FlutterLogo(),
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            ///
            /// Lottie
            ///
            Text('Lottie', style: textTheme.titleLarge),
            Text(
              'Archivos de animación vectorial en formato JSON.',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                if (_controller.isAnimating) {
                  _controller.stop();
                } else {
                  _controller.repeat();
                }
              },
              child: Lottie.asset(
                'assets/animations/lottie.json',
                controller: _controller,
                onLoaded: (composition) {
                  // Configure the AnimationController with the duration of the
                  // Lottie file and start the animation.
                  _controller
                    ..duration = composition.duration
                    ..repeat();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroDetailScreen extends StatelessWidget {
  const HeroDetailScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Hero(
            tag: 'hero-animation',
            child: Container(
              color: Colors.green,
              height: 300.0,
              width: 300.0,
              child: const FlutterLogo(),
            ),
          ),
        ),
      );
}
