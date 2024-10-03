import 'package:adaptive_ui/src/domain/domain.dart';
import 'package:adaptive_ui/src/presentation/presentation.dart';
import 'package:flutter/material.dart';

class CryptoListMediumBody extends StatelessWidget {
  const CryptoListMediumBody({
    required this.cryptos,
    super.key,
  });

  final List<Crypto> cryptos;

  @override
  Widget build(BuildContext context) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
        ),
        itemCount: cryptos.length,
        itemBuilder: (context, index) => CryptoGridItem(crypto: cryptos[index]),
      );
}
