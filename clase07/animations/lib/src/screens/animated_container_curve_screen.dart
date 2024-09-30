import 'package:flutter/material.dart';

class AnimatedContainerCurveScreen extends StatefulWidget {
  const AnimatedContainerCurveScreen({super.key});

  @override
  State<AnimatedContainerCurveScreen> createState() =>
      _AnimatedContainerCurveScreenState();
}

class _AnimatedContainerCurveScreenState
    extends State<AnimatedContainerCurveScreen> {
  static const _curves = [
    CurveChoice(curve: Curves.bounceIn, name: 'Bounce In'),
    CurveChoice(curve: Curves.bounceOut, name: 'Bounce Out'),
    CurveChoice(curve: Curves.easeInCubic, name: 'Ease In Cubic'),
    CurveChoice(curve: Curves.easeOutCubic, name: 'Ease Out Cubic'),
    CurveChoice(curve: Curves.easeInExpo, name: 'Ease In Expo'),
    CurveChoice(curve: Curves.easeOutExpo, name: 'Ease Out Expo'),
    CurveChoice(curve: Curves.elasticIn, name: 'Elastic In'),
    CurveChoice(curve: Curves.elasticOut, name: 'Elastic Out'),
    CurveChoice(curve: Curves.easeInQuart, name: 'Ease In Quart'),
    CurveChoice(curve: Curves.easeOutQuart, name: 'Ease Out Quart'),
    CurveChoice(curve: Curves.easeInCirc, name: 'Ease In Circle'),
    CurveChoice(curve: Curves.easeOutCirc, name: 'Ease Out Circle'),
  ];

  var _selectedCurve = _curves.first;
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
                curve: _selectedCurve.curve,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<CurveChoice>(
                    items: _curves.map((curve) {
                      return DropdownMenuItem<CurveChoice>(
                        value: curve,
                        child: Text(curve.name),
                      );
                    }).toList(),
                    onChanged: (newCurve) {
                      if (newCurve != null) {
                        setState(() => _selectedCurve = newCurve);
                      }
                    },
                    value: _selectedCurve,
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() => _toggle = !_toggle),
                    child: const Text('Change AnimatedContainer Size!'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CurveChoice {
  const CurveChoice({
    required this.curve,
    required this.name,
  });

  final Curve curve;
  final String name;
}
