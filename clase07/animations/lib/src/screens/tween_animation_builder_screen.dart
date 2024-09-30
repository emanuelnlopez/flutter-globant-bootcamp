import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnimationBuilderScreen extends StatefulWidget {
  const TweenAnimationBuilderScreen({super.key});

  @override
  State<TweenAnimationBuilderScreen> createState() =>
      _TweenAnimationBuilderScreenState();
}

class _TweenAnimationBuilderScreenState
    extends State<TweenAnimationBuilderScreen> {
  var _endPosition = pi * 2;
  var _endColor = Colors.blue[500];
  var _endColorFilter = Colors.red[500];
  var _endOpacity = 1.0;
  var _endScale = 1.5;
  var _endOffset = const Offset(100, 0);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaciones con TweenAnimationBuilder'),
      ),
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
            /// Animación de Rotación
            ///
            Text('Animación de Rotación', style: textTheme.titleLarge),
            Text(
              'En este ejemplo, un Container gira usando TweenAnimationBuilder y el parámetro transform de Transform.rotate.',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 10.0),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: _endPosition),
              duration: const Duration(seconds: 3),
              onEnd: () => setState(
                () => _endPosition = (_endPosition == 0) ? pi * 2 : 0.0,
              ),
              builder: (context, value, child) {
                print(value);
                return Transform.rotate(
                  angle: value,
                  child: Image.asset(
                    'assets/images/beach_ball.png',
                    height: 200.0,
                    width: 200.0,
                  ),
                );
              },
            ),
            const SizedBox(height: 30.0),

            ///
            /// Animación de Color
            ///
            Text('Animación de Color', style: textTheme.titleLarge),
            Text(
              'Este ejemplo anima el color de un contenedor de un color a otro usando ColorTween.',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 10.0),
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(begin: Colors.red, end: _endColor),
              duration: const Duration(seconds: 3),
              onEnd: () => setState(
                () => _endColor =
                    (_endColor == Colors.red) ? Colors.blue : Colors.red,
              ),
              builder: (context, value, child) {
                return Container(
                  color: value,
                  height: 150.0,
                  width: 150.0,
                );
              },
            ),
            const SizedBox(height: 30.0),

            ///
            /// Animación de Color usando Color Filter
            ///
            Text('Animación de Color usando Color Filter',
                style: textTheme.titleLarge),
            Text(
              'Este ejemplo anima el color de la imagen usando ColorTween.',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 10.0),
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(begin: Colors.white, end: _endColorFilter),
              duration: const Duration(seconds: 3),
              onEnd: () => setState(
                () => _endColorFilter = (_endColorFilter == Colors.white)
                    ? Colors.red[500]
                    : Colors.white,
              ),
              builder: (context, value, child) {
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    value!,
                    BlendMode.modulate,
                  ),
                  child: Image.asset(
                    'assets/images/beach_ball.png',
                    height: 200.0,
                    width: 200.0,
                  ),
                );
              },
            ),
            const SizedBox(height: 30.0),

            ///
            /// Animación de Opacidad
            ///
            Text('Animación de Opacidad', style: textTheme.titleLarge),
            Text(
              'Este ejemplo muestra cómo cambiar suavemente la opacidad de un widget desde completamente transparente a completamente opaco.',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 10.0),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: _endOpacity),
              duration: const Duration(seconds: 2),
              onEnd: () => setState(
                () => _endOpacity = (_endOpacity == 1.0) ? 0.0 : 1.0,
              ),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Container(
                    color: Colors.blue,
                    height: 150.0,
                    width: 150.0,
                  ),
                );
              },
            ),
            const SizedBox(height: 30.0),

            ///
            /// Animación de Escala
            ///
            Text('Animación de Escala', style: textTheme.titleLarge),
            Text(
              'Este ejemplo muestra cómo cambiar el tamaño de un Container animando su escala de pequeño a grande.',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 10.0),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.5, end: _endScale),
              duration: const Duration(seconds: 2),
              onEnd: () => setState(
                () => _endScale = (_endScale == 1.5) ? 0.5 : 1.5,
              ),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Container(
                    color: Colors.orange,
                    height: 150.0,
                    width: 150.0,
                  ),
                );
              },
            ),
            const SizedBox(height: 30.0),

            ///
            /// Animación de Posición
            ///
            Text('Animación de Posición', style: textTheme.titleLarge),
            Text(
              'Este ejemplo anima la posición de un widget de un punto inicial a otro en la pantalla usando Tween<Offset> y Transform.translate.',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 10.0),
            TweenAnimationBuilder<Offset>(
              tween: Tween<Offset>(
                begin: const Offset(0, 0),
                end: _endOffset,
              ),
              duration: const Duration(seconds: 2),
              onEnd: () => setState(
                () => _endOffset = (_endOffset.dx == 100)
                    ? const Offset(0, 0)
                    : const Offset(100, 0),
              ),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: value,
                  child: Container(
                    color: Colors.purple,
                    height: 150.0,
                    width: 150.0,
                  ),
                );
              },
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
