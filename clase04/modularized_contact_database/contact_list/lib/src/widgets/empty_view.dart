import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('assets/animations/empty_state.json'),
            Text(
              'Nada por acá 🤷‍♂️',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      );
}
