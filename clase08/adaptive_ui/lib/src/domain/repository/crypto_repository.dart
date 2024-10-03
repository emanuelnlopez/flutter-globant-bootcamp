import 'package:adaptive_ui/src/domain/domain.dart';

abstract class CryptoRepository {
  Future<List<Crypto>> getCryptoCurrencies();

  Future<Crypto> getCryptoCurrency({required String id});
}
