import 'package:flutter/material.dart';

import '../../../../app/support/helpers.dart';
import '../../../resources/assets/json_manager.dart';
import '../../../resources/base/state_failure.dart';
import '../widgets/sized_lottie_widget.dart';

class UnauthenticatedErrorView extends StatelessWidget {
  const UnauthenticatedErrorView(this.failure, {super.key});

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
              AssetsJsonManager.unauthenticated,
              dimension: (0.50) * width(context),
            ),
            Text("${failure.message} "),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
