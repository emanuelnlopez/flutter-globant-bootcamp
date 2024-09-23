import 'dart:io';

import 'package:crypto_prices/src/domain/domain.dart';
import 'package:dio/dio.dart';

class DioCryptoRepository implements CryptoRepository {
  final dio = Dio()
    ..interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );

  @override
  Future<List<Crypto>> getCryptoCurrencies() async {
    final response = await dio.get(CryptoRepository.endpoint);

    if (response.statusCode == HttpStatus.ok) {
      return Crypto.fromDynamicList(response.data);
    } else {
      throw Exception('Failed to load crypto data');
    }
  }
}
