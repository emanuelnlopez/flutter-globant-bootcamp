import 'package:adaptive_ui/src/domain/domain.dart';
import 'package:adaptive_ui/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CryptoDetailsScreen extends StatefulWidget {
  const CryptoDetailsScreen({
    required this.id,
    super.key,
  });

  final String? id;

  @override
  State<CryptoDetailsScreen> createState() => _CryptoDetailsScreenState();
}

class _CryptoDetailsScreenState extends State<CryptoDetailsScreen> {
  late final Cryptos _crypto;

  @override
  void initState() {
    super.initState();
    _crypto = context.read<Cryptos>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.id?.isNotEmpty != true) {
        context.pop();
      } else {
        _crypto.getCrypto(id: widget.id!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: StreamBuilder<Crypto>(
        stream: _crypto.cryptoDetailsStream,
        builder: (context, snapshot) {
          late Widget result;

          if (snapshot.hasError) {
            result = Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (!snapshot.hasData) {
            result = const Center(child: CircularProgressIndicator());
          } else {
            final crypto = snapshot.data!;
            result = Padding(
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
                              text:
                                  '\$ ${crypto.currentPrice.toStringAsFixed(2)}',
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
            );
          }

          return result;
        },
      ),
    );
  }
}
