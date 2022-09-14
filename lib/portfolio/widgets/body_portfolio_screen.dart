import 'package:flutter/material.dart';
import 'package:projeto_criptos/portfolio/widgets/wallet_assets_list_view.dart';
import 'package:projeto_criptos/portfolio/widgets/wallet_visibility.dart';


class BodyPortfolioScreen extends StatelessWidget {
  const BodyPortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        WalletVisibility(),
        Divider(thickness: 1),
        WalletAssetsListView(),
      ],
    );
  }
}