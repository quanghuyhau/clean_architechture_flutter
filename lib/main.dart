import 'package:clean_architechture_flutter/presentation/coin/ui/coin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart' as di;
import 'presentation/coin/cubit/coin_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinGecko App',
      home: BlocProvider(
        create: (_) => di.sl<CoinCubit>()..fetchCoins(),
        child: CoinListScreen(),
      ),
    );
  }
}
