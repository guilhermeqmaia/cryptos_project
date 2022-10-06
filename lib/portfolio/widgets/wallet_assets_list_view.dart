import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/user/user_coin_ammount_provider.dart';
import '../../shared/utils/decimal_parse.dart';

import '../provider/balance_provider.dart';
import '../model/crypto_view_data.dart';
import 'asset_list_tile.dart';

class WalletAssetsListView extends ConsumerStatefulWidget {
  const WalletAssetsListView({
    Key? key,
    required this.cryptosData,
  }) : super(key: key);
  final List<CryptoViewData> cryptosData;

  @override
  ConsumerState<WalletAssetsListView> createState() =>
      _$WalletAssetsListViewState();
}

class _$WalletAssetsListViewState extends ConsumerState<WalletAssetsListView> {
  Decimal getBalance(List<CryptoViewData> assets) {
    Decimal balance = dp('0.0');
    for (int index = 0; index < assets.length; index++) {
      balance += assets[index].currentPrice *
          dp(ref.watch(userCoinAmmountProvider)[index].toString());
    }
    return balance;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration.zero,
      () {
        ref.read(balanceProvider.state).state = getBalance(widget.cryptosData);
      },
    );
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: widget.cryptosData.length,
      itemBuilder: (context, index) {
        CryptoViewData crypto = widget.cryptosData[index];
        return Column(
          children: [
            const Divider(thickness: 1),
            AssetListTile(
              crypto: crypto,
              cryptoBalance: dp(
                ref.watch(userCoinAmmountProvider)[index].toString(),
              ),
            ),
          ],
        );
      },
    );
  }
}
