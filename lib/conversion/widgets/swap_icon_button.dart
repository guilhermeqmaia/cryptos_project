import 'package:flutter/material.dart';

import '../../shared/templates/app_assets.dart';
import '../controller/conversion_controller.dart';

class SwapIconButton extends StatefulWidget {
  const SwapIconButton({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ConversionController controller;
  @override
  State<SwapIconButton> createState() => _SwapIconButtonState();
}

class _SwapIconButtonState extends State<SwapIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.sync_alt,
        key: const Key('SwapIcon'),
        color: AppAssets.magenta,
        size: 25,
      ),
      onPressed: () {
        setState(() {
          widget.controller.swapCoins();
        });
      },
    );
  }
}
