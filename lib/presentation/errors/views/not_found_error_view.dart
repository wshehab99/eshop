import 'package:eshop/app/support/helpers.dart';
import 'package:flutter/material.dart';

import '../../../resources/assets/json_manager.dart';
import '../../../resources/base/state_failure.dart';
import '../widgets/retry_button.dart';
import '../widgets/sized_lottie_widget.dart';

class NotFoundErrorView extends StatelessWidget {
  const NotFoundErrorView(this.failure, {super.key});

  final BaseFailure failure;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedLottieWidget(AssetsJsonManager.notFound,
                dimension: (0.50) * width(context)),
            Text(failure.message),
            RetryButton(failure.retry),
          ],
        ),
      ),
    );
  }
}
