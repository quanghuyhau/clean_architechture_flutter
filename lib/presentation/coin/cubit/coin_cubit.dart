import 'package:clean_architechture_flutter/domain/use_case/coin_use_case.dart';
import 'package:clean_architechture_flutter/presentation/coin/cubit/coin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CoinCubit extends Cubit<CoinState> {
  final GetTopCoins getTopCoins;

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
}
