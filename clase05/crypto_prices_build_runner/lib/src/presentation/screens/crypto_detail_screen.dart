import 'package:crypto_prices/src/domain/domain.dart';
import 'package:crypto_prices/src/presentation/presentation.dart';
import 'package:flutter/material.dart';

class CryptoDetailScreen extends StatelessWidget {
  final Crypto crypto;

  const CryptoDetailScreen({
    required this.crypto,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(crypto.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Current Price: ',
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: '\$ ${crypto.currentPrice.toStringAsFixed(2)}',
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Market Cap: ',
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: '\$ ${crypto.marketCap.toStringAsFixed(2)}',
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'High 24h: ',
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: '\$ ${crypto.high24h.toStringAsFixed(2)}',
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Low 24h: ',
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: '\$ ${crypto.low24h.toStringAsFixed(2)}',
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0.0,
              top: 0.0,
              child: CryptoImage(
                height: 100.0,
                width: 100.0,
                tag: crypto.id,
                url: crypto.image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
