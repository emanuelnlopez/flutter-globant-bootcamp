import 'package:animations/src/screens/animated_builder_screen.dart';
import 'package:flutter/material.dart';

class AnimatedWidgetScreen extends StatefulWidget {
  const AnimatedWidgetScreen({super.key});

  @override
  State<AnimatedWidgetScreen> createState() => _AnimatedWidgetScreenState();
}

class _AnimatedWidgetScreenState extends State<AnimatedWidgetScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animation;

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/images/space.jpg',
            alignment: Alignment.center,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          _BeamTransition(listenable: _animation),
          Image.asset('assets/images/spaceship.png'),
        ],
      ),
    );
  }
}

class _BeamTransition extends AnimatedWidget {
  const _BeamTransition({required super.listenable});

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    // print(animation.value);
    return ClipPath(
      clipper: const BeamClipper(),
      child: Container(
        height: 1000,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1.5,
            colors: const [
              Colors.yellow,
              Colors.transparent,
            ],
            stops: [0, animation.value],
          ),
        ),
      ),
    );
  }
}
