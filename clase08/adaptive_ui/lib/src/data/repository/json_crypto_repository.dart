import 'dart:convert';

import 'package:adaptive_ui/src/domain/domain.dart';
import 'package:flutter/services.dart';

class HttpCryptoRepository implements CryptoRepository {
  final _cryptos = <String, Crypto>{};

  Future<void> _loadCryptosFromJson() async {
    final data = await rootBundle.loadString('assets/json/crypto_list.json');
    final cryptoList = Crypto.fromDynamicList(
      json.decode(data),
    );
    for (final crypto in cryptoList) {
      _cryptos[crypto.id] = crypto;
    }
  }

  @override
  Future<List<Crypto>> getCryptoCurrencies() async {
    if (_cryptos.isEmpty) {
      await _loadCryptosFromJson();
    }
    return _cryptos.values.toList();
  }

  @override
  Future<Crypto> getCryptoCurrency({required String id}) async {
    if (_cryptos.isEmpty || !_cryptos.containsKey(id)) {
      await _loadCryptosFromJson();
    }
    return _cryptos[id]!;
  }
}
