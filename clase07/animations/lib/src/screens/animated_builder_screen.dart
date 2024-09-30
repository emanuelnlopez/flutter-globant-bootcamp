import 'package:flutter/material.dart';

class AnimatedBuilderScreen extends StatefulWidget {
  const AnimatedBuilderScreen({super.key});

  @override
  State<AnimatedBuilderScreen> createState() => _AnimatedBuilderScreenState();
}

class _AnimatedBuilderScreenState extends State<AnimatedBuilderScreen> {
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
          // const _StaticBeam(),
          const _AnimatedBeam(),
          Image.asset('assets/images/spaceship.png'),
        ],
      ),
    );
  }
}

class _StaticBeam extends StatelessWidget {
  const _StaticBeam();

  @override
  Widget build(BuildContext context) => ClipPath(
        clipper: const BeamClipper(),
        child: Container(
          height: 1000.0,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              radius: 1.5,
              colors: [
                Colors.yellow,
                Colors.transparent,
              ],
            ),
          ),
        ),
      );
}

class _AnimatedBeam extends StatefulWidget {
  const _AnimatedBeam();

  @override
  State<_AnimatedBeam> createState() => __AnimatedBeamState();
}

class __AnimatedBeamState extends State<_AnimatedBeam>
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
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animation,
        builder: (_, __) {
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
                  stops: [0, _animation.value],
                ),
              ),
            ),
          );
        },
      );
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
