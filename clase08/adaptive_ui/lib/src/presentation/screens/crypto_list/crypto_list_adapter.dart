import 'package:adaptive_ui/src/domain/domain.dart';
import 'package:adaptive_ui/src/presentation/presentation.dart';
import 'package:flutter/material.dart';

class CryptoListAdapter extends BaseAdapter {
  CryptoListAdapter({required this.cryptos});

  final List<Crypto> cryptos;

  @override
  Widget buildCompact(BuildContext context) {
    return CryptoListCompactBody(cryptos: cryptos);
  }

  @override
  Widget buildMedium(BuildContext context) {
    return CryptoListMediumBody(cryptos: cryptos);
  }

  @override
  Widget buildExpanded(BuildContext context) {
    return CryptoListExpandedBody(cryptos: cryptos);
  }

  @override
  Widget buildLarge(BuildContext context) {
    return CryptoListLargeBody(cryptos: cryptos);
  }
}
