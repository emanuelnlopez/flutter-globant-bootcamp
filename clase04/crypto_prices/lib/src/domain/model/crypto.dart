class Crypto {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final int marketCap;
  final int marketCapRank;
  final double high24h;
  final double low24h;
  final double priceChange24h;
  final double priceChangePercentage24h;
  final double marketCapChange24h;
  final double marketCapChangePercentage24h;
  final double ath;
  final double athChangePercentage;
  final DateTime athDate;
  final double atl;
  final double atlChangePercentage;
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

  factory Crypto.fromDynamic(dynamic map) => Crypto(
        id: map['id'],
        symbol: map['symbol'],
        name: map['name'],
        image: map['image'],
        currentPrice: map['current_price'].toDouble(),
        marketCap: map['market_cap'],
        marketCapRank: map['market_cap_rank'],
        high24h: map['high_24h'].toDouble(),
        low24h: map['low_24h'].toDouble(),
        priceChange24h: map['price_change_24h'].toDouble(),
        priceChangePercentage24h: map['price_change_percentage_24h'].toDouble(),
        marketCapChange24h: map['market_cap_change_24h'].toDouble(),
        marketCapChangePercentage24h:
            map['market_cap_change_percentage_24h'].toDouble(),
        ath: map['ath'].toDouble(),
        athChangePercentage: map['ath_change_percentage'].toDouble(),
        athDate: DateTime.parse(map['ath_date']),
        atl: map['atl'].toDouble(),
        atlChangePercentage: map['atl_change_percentage'].toDouble(),
        atlDate: DateTime.parse(map['atl_date']),
      );

  static List<Crypto> fromDynamicList(dynamic list) {
    final result = <Crypto>[];

    if (list != null) {
      for (dynamic map in list) {
        result.add(Crypto.fromDynamic(map));
      }
    }

    return result;
  }
}
