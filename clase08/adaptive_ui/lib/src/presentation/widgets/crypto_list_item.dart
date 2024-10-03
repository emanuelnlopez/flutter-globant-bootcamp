import 'package:adaptive_ui/src/domain/domain.dart';
import 'package:adaptive_ui/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CryptoListItem extends StatelessWidget {
  final Crypto crypto;

  const CryptoListItem({
    super.key,
    required this.crypto,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final prefs = context.read<ApplicationPreferences>();
    final favorite = prefs.favoriteCryptos.contains(crypto.id);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.pushNamed(
        NamedRoutes.details.name,
        pathParameters: {PathParameters.id: crypto.id},
      ),
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
                favorite ? Icons.star : Icons.star_border,
                color: favorite ? Colors.yellow : null,
              ),
              onPressed: () => prefs.toggleFavoriteCrypto(crypto.id),
            ),
          ],
        ),
      ),
    );
  }
}
