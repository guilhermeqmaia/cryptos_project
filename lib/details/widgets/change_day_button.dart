import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/days_provider.dart';

class ChangeDayButton extends HookConsumerWidget {
  const ChangeDayButton({
    Key? key,
    required this.days,
  }) : super(key: key);

  final int days;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var graphDays = ref.watch(daysProvider.state).state;

    return InkWell(
      onTap: () async {
        ref.read(daysProvider.state).state = days;
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: graphDays == days
              ? const Color.fromRGBO(238, 240, 247, 1)
              : Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Text(
          days == 1 ? '24H' : '${days}D',
          style: TextStyle(
            color: graphDays == days ? Colors.black : Colors.grey.shade500,
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}