import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/get_price_provider.dart';

import '../../shared/templates/app_assets.dart';
import '../../shared/utils/currency_formater.dart';
import '../provider/days_provider.dart';

class GraphDetails extends StatefulHookConsumerWidget {
  const GraphDetails({Key? key, required this.historyCoinData})
      : super(key: key);
  final List<FlSpot> historyCoinData;

  @override
  ConsumerState<GraphDetails> createState() => _$GraphDetailsState();
}

class _$GraphDetailsState extends ConsumerState<GraphDetails> {
  @override
  Widget build(BuildContext context) {
    var price = ref.watch(getPriceProvider.state);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: AspectRatio(
        aspectRatio: 16 / 5,
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(
              enabled: false,
              touchCallback: (p0, p1) {
                if (!p0.isInterestedForInteractions) {
                  price.state =
                      currencyFormatter.format(widget.historyCoinData.first.y);
                  setState(() {});
                } else {
                  if (p1?.lineBarSpots?[0].spotIndex != null) {
                    price.state = currencyFormatter.format(widget
                        .historyCoinData[p1!.lineBarSpots![0].spotIndex].y);
                    setState(() {});
                  }
                }
              },
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 2,
                ),
              ),
            ),
            titlesData: FlTitlesData(show: false),
            lineBarsData: [
              LineChartBarData(
                belowBarData: BarAreaData(
                  show: true,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(224, 43, 87, 0.2),
                      Color.fromRGBO(224, 43, 87, 0.02),
                    ],
                  ),
                ),
                barWidth: 3,
                dotData: FlDotData(show: false),
                color: AppAssets.magenta,
                spots: widget.historyCoinData.sublist(
                  0,
                  ref.watch(daysProvider.state).state + 1,
                ),
              ),
            ],
          ),
          swapAnimationDuration: const Duration(milliseconds: 350),
          swapAnimationCurve: Curves.linearToEaseOut,
        ),
      ),
    );
  }
}
