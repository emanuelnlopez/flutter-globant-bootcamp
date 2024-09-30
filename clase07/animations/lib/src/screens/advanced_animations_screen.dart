import 'package:flutter/material.dart';

class AdvancedAnimationsScreen extends StatefulWidget {
  const AdvancedAnimationsScreen({super.key});

  @override
  State<AdvancedAnimationsScreen> createState() =>
      _AdvancedAnimationsScreenState();
}

class _AdvancedAnimationsScreenState extends State<AdvancedAnimationsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimations() {
    setState(() {
      if (_controller.isCompleted) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaciones avanzadas'),
      ),
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
                    /// CustomPainter
                    ///
                    Text('CustomPainter', style: textTheme.titleLarge),
                    Text(
                      'Permite crear animaciones complejas dibujando manualmente en un lienzo.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10.0),
                    CustomPaint(
                      size: const Size(100.0, 100.0),
                      painter: AnimatedCirclePainter(_controller),
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

class AnimatedCirclePainter extends CustomPainter {
  final Animation<double> animation;

  AnimatedCirclePainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.pink;
    double radius = animation.value * 50;
    canvas.drawCircle(size.center(Offset.zero), radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
