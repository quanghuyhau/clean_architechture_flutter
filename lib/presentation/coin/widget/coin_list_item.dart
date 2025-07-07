import 'package:flutter/material.dart';
import 'package:clean_architechture_flutter/domain/entities/coin_entities.dart';
import 'package:intl/intl.dart';

/// Widget hiển thị thông tin 1 đồng coin trong danh sách
class CoinListItem extends StatelessWidget {
  final Coin coin;

  const CoinListItem({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    /// Format giá tiền
    final priceFormatter = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 2,
    );

    /// Format vốn hoá thị trường
    final marketCapFormatter = NumberFormat.compactCurrency(
      symbol: '\$',
      decimalDigits: 2,
    );

    /// Biến động giá
    final priceChange = coin.priceChangePercentage24h;
    final priceChangeColor = priceChange >= 0 ? Colors.green : Colors.red;
    final priceChangePrefix = priceChange >= 0 ? '+' : '';

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
      ),
      child: Row(
        children: [
          /// Ảnh logo coin
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              coin.image,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.error),
            ),
          ),

          const SizedBox(width: 12),

          /// Tên và ký hiệu coin
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Tên coin
                Text(
                  'Tên: ${coin.name}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                /// Ký hiệu coin
                Text(
                  'Ký hiệu: ${coin.symbol.toUpperCase()}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          /// Thông tin chi tiết bên phải
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// Thứ hạng vốn hoá
              Text(
                'Hạng: #${coin.marketCapRank}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              /// Giá hiện tại
              Text(
                'Giá: ${priceFormatter.format(coin.currentPrice)}',
                style: const TextStyle(fontSize: 14),
              ),

              /// % thay đổi 24h
              Text(
                'Biến động 24h: $priceChangePrefix${priceChange.toStringAsFixed(2)}%',
                style: TextStyle(
                  fontSize: 12,
                  color: priceChangeColor,
                ),
              ),

              /// Vốn hoá thị trường
              Text(
                'Tổng vốn thị trường: ${marketCapFormatter.format(coin.marketCap)}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
