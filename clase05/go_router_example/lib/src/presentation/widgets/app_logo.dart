import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.width,
  });

  final double? width;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(32.0),
        child: Image.asset(
          'assets/images/logo.png',
          width: width ?? double.infinity,
        ),
      );
}
