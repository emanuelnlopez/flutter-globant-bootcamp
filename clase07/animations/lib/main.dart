import 'package:animations/src/screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AnimationsApp());

class AnimationsApp extends StatelessWidget {
  const AnimationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animaciones!',
      initialRoute: '/',
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
        useMaterial3: true,
      ),
      routes: AppRoutes.routes,
    );
  }
}

abstract class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    Routes.home: (_) => const AnimationIndexScreen(),
    Routes.container: (_) => const ContainerScreen(),
    Routes.animatedContainer: (_) => const AnimatedContainerScreen(),
    Routes.animatedContainerCurve: (_) => const AnimatedContainerCurveScreen(),
    Routes.implicitAnimations: (_) => const ImplicitAnimationsScreen(),
    Routes.explicitRotationTransition: (_) => const RotationTransitionScreen(),
    Routes.explicitAnimations: (_) => const ExplicitAnimationsScreen(),
    Routes.heroDetail: (_) => const HeroDetailScreen(),
    Routes.tweentAnimationBuilder: (_) => const TweenAnimationBuilderScreen(),
    Routes.animatedBuilder: (_) => const AnimatedBuilderScreen(),
    Routes.animatedWidget: (_) => const AnimatedWidgetScreen(),
    Routes.other: (_) => const OtherAnimationsScreen(),
    Routes.rive: (_) => const RiveAnimationScreen(),
    Routes.advancedAnimations: (_) => const AdvancedAnimationsScreen(),
  };
}

abstract class Routes {
  static const home = '/';
  static const container = '/container';
  static const animatedContainer = '/animated';
  static const animatedContainerCurve = '/animatedCurve';
  static const implicitAnimations = '/implicitAnimations';
  static const explicitAnimations = '/explicitAnimations';
  static const explicitRotationTransition = '/explicitRotationTransition';
  static const heroDetail = '/heroDetail';
  static const tweentAnimationBuilder = '/tweentAnimationBuilder';
  static const animatedBuilder = '/animatedBuilder';
  static const animatedWidget = '/animatedWidget';
  static const other = '/other';
  static const rive = '/rive';
  static const advancedAnimations = '/advancedAnimations';
}
