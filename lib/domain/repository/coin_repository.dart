
import 'package:clean_architechture_flutter/domain/entities/coin_entities.dart';

abstract class CoinRepository {
  Future<List<Coin>> getTopCoins();
}
