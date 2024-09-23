import 'dart:convert';
import 'dart:io';

import 'package:crypto_prices/src/domain/domain.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class HttpCryptoRepository implements CryptoRepository {
  final _logger = Logger('HttpCryptoRepository');

  @override
  Future<List<Crypto>> getCryptoCurrencies() async {
    final uri = Uri.parse(CryptoRepository.endpoint);

    _logger.finest('--- HTTP REQUEST ---\nURL: ${CryptoRepository.endpoint}');

    final response = await http.get(uri);

    _logger.finest(
      '--- HTTP response ---\nStatus Code: ${response.statusCode}\nResponse Body: ${response.body}',
    );

    if (response.statusCode == HttpStatus.ok) {
      final cryptoList = Crypto.fromDynamicList(
        json.decode(response.body),
      );
      return cryptoList;
    } else {
      throw Exception('Failed to load crypto data');
    }
  }
}
