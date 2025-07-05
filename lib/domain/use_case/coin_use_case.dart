

import 'package:clean_architechture_flutter/domain/entities/coin_entities.dart';
import 'package:clean_architechture_flutter/domain/repository/coin_repository.dart';

class GetTopCoins {
  final CoinRepository repository;

  GetTopCoins(this.repository);

  Future<List<Coin>> getCoins() async {
    return await repository.getTopCoins();
  }
}
