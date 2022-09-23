
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/templates/warren_button.dart';

class ErrorBody extends HookConsumerWidget {
  const ErrorBody({
    Key? key,
    required this.onError,
  }) : super(key: key);

  final void Function()? onError;

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
          const Text(
            'Ops! Ocorreu um erro',
            style: TextStyle(
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
              onPressed: onError,
              color: Colors.black87,
              text: 'Tentar Novamente',
            ),
          ),
        ],
      ),
    );
  }
}