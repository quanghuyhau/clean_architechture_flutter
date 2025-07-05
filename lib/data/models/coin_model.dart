import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/coin_entities.dart';

part 'coin_model.g.dart';

@JsonSerializable()
class CoinModel {
  final String id;
  final String name;
  final String symbol;
  final String image;

  @JsonKey(name: 'current_price')
  final double? currentPrice;

  @JsonKey(name: 'market_cap')
  final double? marketCap;

  @JsonKey(name: 'price_change_percentage_24h')
  final double? priceChangePercentage24h;

  @JsonKey(name: 'market_cap_rank')
  final int? marketCapRank;

  const CoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.priceChangePercentage24h,
    required this.marketCapRank,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoinModelToJson(this);

  Coin toEntity() {
    return Coin(
      id: id,
      name: name,
      symbol: symbol,
      image: image,
      currentPrice: currentPrice ?? 0,
      marketCap: marketCap ?? 0,
      priceChangePercentage24h: priceChangePercentage24h ?? 0,
      marketCapRank: marketCapRank ?? 0,
    );
  }
}
