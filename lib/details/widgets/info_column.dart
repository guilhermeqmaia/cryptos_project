import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import '../../portfolio/model/crypto_view_data.dart';

import '../../l10n/core_strings.dart';
import '../../shared/templates/default_info_row.dart';
import '../../shared/utils/currency_formater.dart';
import '../../shared/utils/decimal_to_double.dart';
import '../model/prices_view_data.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({
    Key? key,
    required this.day,
    required this.variation,
    required this.coinAmmount,
    required this.coin,
    required this.data,
  }) : super(key: key);

  final int day;
  final double variation;
  final Decimal coinAmmount;
  final CryptoViewData coin;
  final PricesViewData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          const Divider(thickness: 1),
          DefaultInfoRow(
            label: '${CoreStrings.of(context)!.price} ${day}D',
            text: currencyFormatter.format(
              data.prices.reversed.elementAt(day).last,
            ),
          ),
          const Divider(thickness: 1),
          DefaultInfoRow(
            label: '${CoreStrings.of(context)!.variation} ${day}D',
            text:
                '${variation > 0 ? '+' : ''} ${variation.toStringAsFixed(2)}%',
            color: variation > 0 ? Colors.green : Colors.red,
            fontWeight: FontWeight.w500,
          ),
          const Divider(thickness: 1),
          DefaultInfoRow(
            label: CoreStrings.of(context)!.quantity,
            text:
                '${coinAmmount.toStringAsFixed(4)} ${coin.symbol.toUpperCase()}',
          ),
          const Divider(thickness: 1),
          DefaultInfoRow(
            label: CoreStrings.of(context)!.value,
            text: currencyFormatter.format(
              dtd(coinAmmount * coin.currentPrice),
            ),
          ),
        ],
      ),
    );
  }
}
