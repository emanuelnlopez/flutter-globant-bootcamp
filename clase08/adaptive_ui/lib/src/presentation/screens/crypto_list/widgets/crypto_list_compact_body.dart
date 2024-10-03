import 'package:adaptive_ui/src/domain/domain.dart';
import 'package:adaptive_ui/src/presentation/presentation.dart';
import 'package:flutter/material.dart';

class CryptoListCompactBody extends StatelessWidget {
  const CryptoListCompactBody({
    required this.cryptos,
    super.key,
  });

  final List<Crypto> cryptos;

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: cryptos.length,
        itemBuilder: (context, index) => CryptoListItem(crypto: cryptos[index]),
        separatorBuilder: (_, __) => const Divider(
          endIndent: 16.0,
          height: 1.0,
          indent: 16.0,
          thickness: 1.0,
        ),
      );
}
