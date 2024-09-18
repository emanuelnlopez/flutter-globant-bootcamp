import 'dart:async';

import 'package:crypto_prices/src/domain/domain.dart';
import 'package:logging/logging.dart';

abstract class Disposable {
  void dispose();
}

class Cryptos implements Disposable {
  Cryptos({
    required CryptoRepository cryptoRepository,
  }) : _cryptoRepository = cryptoRepository;

  final _logger = Logger('CryptoListState');
  final CryptoRepository _cryptoRepository;

  final _cryptoStreamController = StreamController<List<Crypto>>.broadcast();

  Stream<List<Crypto>> get cryptoStream => _cryptoStreamController.stream;

  void getCryptos() async {
    try {
      final cryptos = await _cryptoRepository.getCryptoCurrencies();
      _cryptoStreamController.add(cryptos);
    } catch (error) {
      _logger.severe(error);
      _cryptoStreamController.addError(error);
    }
  }

  @override
  void dispose() {
    _cryptoStreamController.close();
  }
}
