import 'dart:async';

import 'package:adaptive_ui/src/domain/domain.dart';
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

  final _cryptoDetailsStreamController = StreamController<Crypto>.broadcast();

  Stream<List<Crypto>> get cryptoStream => _cryptoStreamController.stream;

  Stream<Crypto> get cryptoDetailsStream =>
      _cryptoDetailsStreamController.stream;

  void getCryptos() async {
    try {
      final cryptos = await _cryptoRepository.getCryptoCurrencies();
      _cryptoStreamController.add(cryptos);
    } catch (error) {
      _logger.severe(error);
      _cryptoStreamController.addError(error);
    }
  }

  void getCrypto({required String id}) async {
    try {
      final crypto = await _cryptoRepository.getCryptoCurrency(id: id);
      _cryptoDetailsStreamController.add(crypto);
    } catch (error) {
      _logger.severe(error);
      _cryptoDetailsStreamController.addError(error);
    }
  }

  @override
  void dispose() {
    _cryptoStreamController.close();
    _cryptoDetailsStreamController.close();
  }
}
