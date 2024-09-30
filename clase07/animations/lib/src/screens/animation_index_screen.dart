import 'package:animations/main.dart';
import 'package:flutter/material.dart';

class AnimationIndexScreen extends StatelessWidget {
  const AnimationIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animaciones!')),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.container,
            ),
            subtitle: const Text('Cambiando el tamaño de un Container'),
            title: const Text('Container'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.animatedContainer,
            ),
            subtitle: const Text('Cambiando el tamaño de un AnimatedContainer'),
            title: const Text('AnimatedContainer'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.implicitAnimations,
            ),
            subtitle: const Text('Todos los ejemplos en una pantalla'),
            title: const Text('Animaciones implícitas'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.animatedContainerCurve,
            ),
            subtitle: const Text('Eligiendo Curve'),
            title: const Text('AnimatedContainer'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.tweentAnimationBuilder,
            ),
            subtitle: const Text('usando TweenAnimationBuilder'),
            title: const Text('Animaciones implícitas'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.explicitRotationTransition,
            ),
            subtitle: const Text('Ejemplo de animación explícita'),
            title: const Text('RotationTransition'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.explicitAnimations,
            ),
            subtitle: const Text('Transition Widgets'),
            title: const Text('Animaciones explícitas'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.animatedBuilder,
            ),
            subtitle: const Text('Ejemplo de animación explícita'),
            title: const Text('AnimatedBuilder'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.animatedWidget,
            ),
            subtitle: const Text('Ejemplo de animación explícita'),
            title: const Text('AnimatedWidget'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.other,
            ),
            subtitle: const Text('Hero, Lottie'),
            title: const Text('Otro tipo de animaciones'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.rive,
            ),
            title: const Text('Animaciones Rive'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.advancedAnimations,
            ),
            subtitle: const Text('Usando CustomPaint'),
            title: const Text('Animaciones avanzadas'),
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      )),
    );
  }
}
