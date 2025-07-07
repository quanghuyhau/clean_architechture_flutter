import 'package:clean_architechture_flutter/presentation/coin/widget/coin_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/coin_cubit.dart';
import '../cubit/coin_state.dart';

class CoinListScreen extends StatelessWidget {
  const CoinListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CoinCubit, CoinState>(
        builder: (context, state) {
          if (state is CoinLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CoinLoaded) {
            return ListView.builder(
              itemCount: state.coins.length,
              itemBuilder: (context, index) {
                return CoinListItem(coin: state.coins[index]);
              },
            );
          } else if (state is CoinError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Start'));
          }
        },
      ),
    );
  }
}
