import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('assets/animations/loading.json'),
            Text(
              'Cargando... ⏳',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      );
}
