import 'package:eshop/app/localization/app_localization.dart';
import 'package:flutter/material.dart';
import '../../../resources/others/string_manager.dart';

class RetryButton extends StatelessWidget {
  const RetryButton(this.onPressed, {super.key});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        StringManager.retry.translate(context),
      ),
    );
  }
}
