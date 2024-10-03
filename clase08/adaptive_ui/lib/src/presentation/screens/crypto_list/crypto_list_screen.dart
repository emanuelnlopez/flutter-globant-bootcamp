import 'package:adaptive_ui/src/domain/domain.dart';
import 'package:adaptive_ui/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  late final Cryptos _cryptoListState;
  final _logger = Logger('CryptoListScreen');

  @override
  void initState() {
    super.initState();
    _cryptoListState = context.read<Cryptos>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logger.finest('Requesting cryptos...');
      _cryptoListState.getCryptos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<ApplicationPreferences>();
    return Scaffold(
      appBar: AppBar(
        title:
            Text(prefs.onlyFavorites ? 'Favorite Cryptos' : 'Top 100 Cryptos'),
        actions: [
          IconButton(
            icon: Icon(
              prefs.onlyFavorites ? Icons.star : Icons.star_border,
              color: prefs.onlyFavorites ? Colors.yellow : null,
            ),
            onPressed: prefs.toggleOnlyFavorite,
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.pushNamed(NamedRoutes.settings.name),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _cryptoListState.getCryptos(),
        child: StreamBuilder(
          stream: _cryptoListState.cryptoStream,
          builder: (context, snapshot) {
            late Widget result;

            if (snapshot.hasError) {
              result = Center(child: Text(snapshot.error.toString()));
            } else if (!snapshot.hasData) {
              result = const Center(child: CircularProgressIndicator());
            } else {
              var cryptos = snapshot.data!;
              if (prefs.onlyFavorites) {
                cryptos = cryptos
                    .where(
                        (crypto) => prefs.favoriteCryptos.contains(crypto.id))
                    .toList();
              }
              result = CryptoListAdapter(cryptos: cryptos).build(context);
            }
            return result;
          },
        ),
      ),
    );
  }
}
