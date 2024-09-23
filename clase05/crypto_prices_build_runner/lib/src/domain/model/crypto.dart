import 'package:json_annotation/json_annotation.dart';

part 'crypto.g.dart';

@JsonSerializable()
class Crypto {
  final String id;
  final String symbol;
  final String name;
  final String image;
  @JsonKey(name: 'current_price')
  final double currentPrice;
  @JsonKey(name: 'market_cap')
  final int marketCap;
  @JsonKey(name: 'market_cap_rank')
  final int marketCapRank;
  @JsonKey(name: 'high_24h')
  final double high24h;
  @JsonKey(name: 'low_24h')
  final double low24h;
  @JsonKey(name: 'price_change_24h')
  final double priceChange24h;
  @JsonKey(name: 'price_change_percentage_24h')
  final double priceChangePercentage24h;
  @JsonKey(name: 'market_cap_change_24h')
  final double marketCapChange24h;
  @JsonKey(name: 'market_cap_change_percentage_24h')
  final double marketCapChangePercentage24h;
  final double ath;
  @JsonKey(name: 'ath_change_percentage')
  final double athChangePercentage;
  @JsonKey(name: 'ath_date')
  final DateTime athDate;
  final double atl;
  @JsonKey(name: 'atl_change_percentage')
  final double atlChangePercentage;
  @JsonKey(name: 'atl_date')
  final DateTime atlDate;

  Crypto({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.high24h,
    required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.marketCapChange24h,
    required this.marketCapChangePercentage24h,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) => _$CryptoFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoToJson(this);

  static List<Crypto> fromDynamicList(dynamic list) {
    final result = <Crypto>[];

    if (list != null) {
      for (dynamic map in list) {
        result.add(Crypto.fromJson(map));
      }
    }

    return result;
  }
}
