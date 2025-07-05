class Coin {
  final String id;
  final String name;
  final String symbol;
  final String image;
  final double currentPrice;
  final double marketCap;
  final double priceChangePercentage24h;
  final int marketCapRank;

  const Coin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.priceChangePercentage24h,
    required this.marketCapRank,
  });
}
