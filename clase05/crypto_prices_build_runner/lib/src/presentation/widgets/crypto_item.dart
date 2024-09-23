import 'package:crypto_prices/src/domain/domain.dart';
import 'package:crypto_prices/src/presentation/presentation.dart';
import 'package:flutter/material.dart';

class CryptoItem extends StatelessWidget {
  final Crypto crypto;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const CryptoItem({
    super.key,
    required this.crypto,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CryptoDetailScreen(crypto: crypto),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              crypto.marketCapRank.toString(),
              style: theme.textTheme.headlineSmall,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: CryptoImage(
                height: 40.0,
                width: 40.0,
                tag: crypto.id,
                url: crypto.image,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    crypto.name,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    crypto.symbol.toUpperCase(),
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                '\$ ${crypto.currentPrice.toStringAsFixed(2)}',
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.end,
              ),
            ),
            IconButton(
              icon: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                color: isFavorite ? Colors.yellow : null,
              ),
              onPressed: onFavoritePressed,
            ),
          ],
        ),
      ),
    );
  }
}
