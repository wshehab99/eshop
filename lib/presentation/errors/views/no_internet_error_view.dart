import 'package:eshop/app/localization/app_localization.dart';
import 'package:eshop/app/support/helpers.dart';
import 'package:flutter/material.dart';

import '../../../resources/assets/json_manager.dart';
import '../../../resources/base/state_failure.dart';
import '../widgets/retry_button.dart';
import '../widgets/sized_lottie_widget.dart';

class NoInternetErrorView extends StatelessWidget {
  const NoInternetErrorView(this.failure, {super.key});

  final BaseFailure failure;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedLottieWidget(
              AssetsJsonManager.noInternet,
              dimension: (0.50) * width(context),
            ),
            Text(failure.message.translate(context)),
            RetryButton(failure.retry),
          ],
        ),
      ),
    );
  }
}
