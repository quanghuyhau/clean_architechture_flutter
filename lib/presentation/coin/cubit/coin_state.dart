
import 'package:clean_architechture_flutter/domain/entities/coin_entities.dart';

abstract class CoinState {}

class CoinInitial extends CoinState {}

class CoinLoading extends CoinState {}

class CoinLoaded extends CoinState {
  final List<Coin> coins;

  CoinLoaded({required this.coins});
}

class CoinError extends CoinState {
  final String message;

  CoinError({required this.message});
}
