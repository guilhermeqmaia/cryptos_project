import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/details/widgets/graph_details.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load GraphDetails THEN look for a AspectRatio widget',
      (WidgetTester tester) async {
    List<FlSpot> dados = _data
        .map((price) => FlSpot(price[0].toDouble(), price[1].toDouble()))
        .toList();
    await loadPage(tester, GraphDetails(historyCoinData: dados));

    expect(find.byType(AspectRatio), findsOneWidget);
  });
}

List<List<num>> _data = [
  [214, 2142],
  [214, 2142],
  [214, 2142],
  [214, 2142],
  [214, 2142],
  [214, 2142],
];
