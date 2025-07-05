import 'package:flutter/material.dart';
import 'package:clean_architechture_flutter/domain/entities/coin_entities.dart';
import 'package:intl/intl.dart';

class CoinListItem extends StatelessWidget {
  final Coin coin;

  const CoinListItem({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final priceFormatter = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 2,
    );
    final marketCapFormatter = NumberFormat.compactCurrency(
      symbol: '\$',
      decimalDigits: 2,
    );

    final priceChange = coin.priceChangePercentage24h;
    final priceChangeColor = priceChange >= 0 ? Colors.green : Colors.red;
    final priceChangePrefix = priceChange >= 0 ? '+' : '';

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2))),
      ),
      child: Row(
        children: [
          // Icon
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

          // Name + Symbol
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  coin.symbol.toUpperCase(),
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),

          // Rank
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '#${coin.marketCapRank}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              // Price
              Text(
                priceFormatter.format(coin.currentPrice),
                style: const TextStyle(fontSize: 14),
              ),
              // Change %
              Text(
                '$priceChangePrefix${priceChange.toStringAsFixed(2)}%',
                style: TextStyle(fontSize: 12, color: priceChangeColor),
              ),
              // Market Cap
              Text(
                marketCapFormatter.format(coin.marketCap),
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
