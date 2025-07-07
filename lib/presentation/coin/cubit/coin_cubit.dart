import 'package:clean_architechture_flutter/domain/entities/coin_entities.dart';
import 'package:clean_architechture_flutter/domain/use_case/coin_use_case.dart';
import 'package:clean_architechture_flutter/presentation/coin/cubit/coin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CoinCubit extends Cubit<CoinState> {
  final GetTopCoins getTopCoins;
  final List<Coin> _allCoins = [];

  CoinCubit({required this.getTopCoins}) : super(CoinInitial());

  Future<void> fetchCoins() async {
    emit(CoinLoading());
    try {
      final coins = await getTopCoins.getCoins();
      emit(CoinLoaded(coins: coins));
    } catch (e) {
      emit(CoinError(message: e.toString()));
    }
  }

  void searchCoin(String query) {
    if (state is CoinLoaded) {
      final filtered = _allCoins
          .where((coin) => coin.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(CoinLoaded(coins: filtered));
    }
  }
}
