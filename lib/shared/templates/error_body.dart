import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/core_strings.dart';
import 'warren_button.dart';

class ErrorBody extends ConsumerWidget {
  const ErrorBody({
    Key? key,
    required this.onRetry,
  }) : super(key: key);

  final void Function()? onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/error.png',
            scale: 2,
          ),
          Text(
            CoreStrings.of(context)!.errorMessage,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: WarrenButton(
              onPressed: onRetry,
              color: Colors.black87,
              text: CoreStrings.of(context)!.retry,
            ),
          ),
        ],
      ),
    );
  }
}
