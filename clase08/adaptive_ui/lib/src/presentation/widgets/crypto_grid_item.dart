import 'package:adaptive_ui/src/domain/domain.dart';
import 'package:adaptive_ui/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CryptoGridItem extends StatelessWidget {
  const CryptoGridItem({
    super.key,
    required this.crypto,
    this.imageSize = 100,
  });

  final Crypto crypto;
  final double imageSize;

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
      child: Stack(
        alignment: Alignment.center,
        children: [
          CryptoImage(
            height: 100.0,
            width: 100.0,
            tag: crypto.id,
            url: crypto.image,
          ),
          Positioned(
            bottom: 4.0,
            left: 4.0,
            right: 4.0,
            child: Container(
              color: Colors.black.withOpacity(0.3),
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              child: Text(
                '${crypto.name} ${crypto.symbol.toUpperCase()}',
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            right: 4.0,
            top: 4.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: ColoredBox(
                color: Colors.black.withOpacity(0.05),
                child: IconButton(
                  icon: Icon(
                    favorite ? Icons.star : Icons.star_border,
                    color: favorite ? Colors.yellow : null,
                  ),
                  onPressed: () => prefs.toggleFavoriteCrypto(crypto.id),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
