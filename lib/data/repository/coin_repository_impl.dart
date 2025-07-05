import 'package:clean_architechture_flutter/data/data_source/coin_api_service.dart';
import 'package:clean_architechture_flutter/domain/entities/coin_entities.dart';
import 'package:clean_architechture_flutter/domain/repository/coin_repository.dart';

class CoinRepositoryImpl implements CoinRepository {
  final CoinApiService apiService;

  CoinRepositoryImpl(this.apiService);

  @override
  Future<List<Coin>> getTopCoins() async {
    final models = await apiService.getTopCoins();         // List<CoinModel>
    return models.map((model) => model.toEntity()).toList(); // List<Coin>
  }
}
