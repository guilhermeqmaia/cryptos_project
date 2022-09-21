import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/utils/currency_formater.dart';
import '../controller/details_asset_notifier_provider.dart';

class TopPageAssetContainer extends HookConsumerWidget {
  TopPageAssetContainer({Key? key}) : super(key: key);
  late CryptoViewData model;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CryptoViewData model = ref.watch(detailsAssetProvider.notifier).state;
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                model.name,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  color: Color.fromRGBO(47, 47, 51, 1),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: Image.network(model.image).image,
              ),
            ],
          ),
          Text(model.symbol.toUpperCase()),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Text(
              currencyFormatter.format(
                model.currentPrice,
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromRGBO(47, 47, 51, 1),
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
