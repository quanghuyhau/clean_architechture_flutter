import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/coin_model.dart';

part 'coin_api_service.g.dart';

@RestApi()
abstract class CoinApiService {
  factory CoinApiService(Dio dio, {String? baseUrl}) = _CoinApiService;

  @GET("/coins/markets")
  Future<List<CoinModel>> getTopCoins({
    @Query('vs_currency') String vsCurrency = 'usd',
    @Query('order') String order = 'market_cap_desc',
    @Query('per_page') int perPage = 100,
    @Query('page') int page = 1,
    @Query('sparkline') bool sparkline = false,
  });
}
