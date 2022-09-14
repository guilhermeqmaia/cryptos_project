import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/details_asset_provider.dart';
import 'package:projeto_criptos/portfolio/controller/visible_provider.dart';

import '../../shared/models/asset_model.dart';
import '../../shared/utils/currency_formater.dart';
import '../../shared/utils/decimal_to_double.dart';

class AssetListTile extends HookConsumerWidget {
  const AssetListTile({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final AssetModel asset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visible = ref.watch(visibleProvider.state);
    return ListTile(
      onTap: () {
        ref.read(detailsAssetProvider.notifier).changeDetailsAsset(asset);
        Navigator.of(context).pushNamed('/details');
      },
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.transparent,
        backgroundImage: Image.asset(asset.icon).image,
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Text(asset.symbol)),
          visible.state
              ? Text(
                  currencyFormatter.format(
                    dtd(asset.coinBalance) * dtd(asset.currentPrice),
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                )
              : Container(
                  width: 110,
                  height: 18,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
          const Padding(padding: EdgeInsets.only(left: 10)),
          const Icon(Icons.keyboard_arrow_right),
        ],
      ),
      subtitle: Row(
        children: [
          Text(
            asset.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
          const Spacer(),
          visible.state
              ? Text("${asset.coinBalance.toString()} ${asset.symbol}")
              : Container(
                  width: 60,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
          const SizedBox(width: 35),
        ],
      ),
    );
  }
}