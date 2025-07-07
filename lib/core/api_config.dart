/// Đây là nơi quản lý toàn bộ các URL của app
class ApiConfig {
  static const String uatBaseUrl = 'https://api.uat.coingecko.com/api/v3/';
  static const String prodBaseUrl = 'https://api.coingecko.com/api/v3/';

  static String getBaseUrl({bool isProd = true}) {
    return isProd ? prodBaseUrl : uatBaseUrl;
  }
}
