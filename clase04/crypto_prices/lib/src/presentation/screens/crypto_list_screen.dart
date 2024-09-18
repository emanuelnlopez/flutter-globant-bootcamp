import 'package:crypto_prices/src/domain/domain.dart';
import 'package:crypto_prices/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  late final Cryptos _cryptoListState;
  @override
  void initState() {
    super.initState();
    _cryptoListState = context.read<Cryptos>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cryptoListState.getCryptos();
    });
  }

  @override
  void dispose() {
    _cryptoListState.dispose();
    super.dispose();
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
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            ),
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
              result = Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (!snapshot.hasData) {
              result = const Center(child: CircularProgressIndicator());
            } else {
              var cryptoList = snapshot.data!;
              if (prefs.onlyFavorites) {
                cryptoList = cryptoList
                    .where(
                        (crypto) => prefs.favoriteCryptos.contains(crypto.id))
                    .toList();
              }

              result = _CryptoListBody(cryptoList: cryptoList);
            }
            return result;
          },
        ),
      ),
    );
  }
}

class _CryptoListBody extends StatelessWidget {
  const _CryptoListBody({required this.cryptoList});

  final List<Crypto> cryptoList;

  @override
  Widget build(BuildContext context) {
    final prefs = context.read<ApplicationPreferences>();
    return ListView.separated(
      itemCount: cryptoList.length,
      itemBuilder: (context, index) {
        final crypto = cryptoList[index];

        return CryptoItem(
          crypto: crypto,
          isFavorite: prefs.favoriteCryptos.contains(crypto.id),
          onFavoritePressed: () => prefs.toggleFavoriteCrypto(crypto.id),
        );
      },
      separatorBuilder: (_, __) => const Divider(
        endIndent: 16.0,
        height: 1.0,
        indent: 16.0,
        thickness: 1.0,
      ),
    );
  }
}
