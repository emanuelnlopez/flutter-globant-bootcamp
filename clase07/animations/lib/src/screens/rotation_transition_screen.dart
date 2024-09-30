import 'package:flutter/material.dart';

class RotationTransitionScreen extends StatefulWidget {
  const RotationTransitionScreen({super.key});

  @override
  State<RotationTransitionScreen> createState() =>
      _RotationTransitionScreenState();
}

class _RotationTransitionScreenState extends State<RotationTransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  var _label = 'ANIMAR!';

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    // Si queremos que la animación inicie automaticamente
    //..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RotationTransition')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Center(
              child: RotationTransition(
                alignment: Alignment.center,
                turns: _animationController,
                child: Image.asset(
                  'assets/images/beach_ball.png',
                  height: 200.0,
                  width: 200.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  if (_animationController.isAnimating) {
                    _animationController.stop();
                    setState(() => _label = 'ANIMAR!');
                  } else {
                    _animationController.repeat();
                    setState(() => _label = 'DETENER!');
                  }
                },
                child: Text(_label),
              ),
            )
          ],
        ),
      ),
    );
  }
}
