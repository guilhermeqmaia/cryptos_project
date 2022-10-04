import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import 'package:projeto_criptos/portfolio/widgets/asset_list_tile.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load AssetListTile THEN return at least one widget text', (WidgetTester tester) async {
    await loadPage(tester, asset);

    await tester.pumpAndSettle();

    expect(find.byType(Text), findsWidgets);
  });
}

AssetListTile asset = AssetListTile(
  crypto: CryptoViewData(
    id: 'id',
    symbol: 'symbol',
    name: 'name',
    image: Faker().image.image(),
    currentPrice: dp('0.0'),
    variation: 4,
  ),
  cryptoBalance: dp('245.21'),
);