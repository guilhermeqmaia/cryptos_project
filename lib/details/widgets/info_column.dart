import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/details_asset_provider.dart';

import '../../shared/models/asset_model.dart';
import '../../shared/utils/currency_formater.dart';
import '../../shared/utils/decimal_to_double.dart';
import 'info_card_details.dart';

class InfoColumn extends HookConsumerWidget {
  InfoColumn({
    Key? key,
  }) : super(key: key);

  late AssetModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    model = ref.watch(detailsAssetProvider.notifier).state;
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
      ),
      child: Column(
        children: [
          const Divider(thickness: 1),
          InfoCardDetails(
            label: 'Preço Atual',
            text: currencyFormatter.format(
              dtd(model.currentPrice),
            ),
          ),
          const Divider(thickness: 1),
          InfoCardDetails(
            label: 'Variação 24H',
            text: '${model.variation > 0 ? '+' : ''}${model.variation.toStringAsFixed(2)}%',
            color: model.variation > 0 ? Colors.green : Colors.red,
          ),
          const Divider(thickness: 1),
          InfoCardDetails(
            label: 'Quantidade',
            text: '${model.coinBalance.toString()} ${model.symbol}',
          ),
          const Divider(thickness: 1),
          InfoCardDetails(
            label: 'Valor',
            text: currencyFormatter.format(
              dtd(model.coinBalance) * dtd(model.currentPrice),
            ),
          ),
        ],
      ),
    );
  }
}
