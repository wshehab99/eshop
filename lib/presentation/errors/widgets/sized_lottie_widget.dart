import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SizedLottieWidget extends StatelessWidget {
  const SizedLottieWidget(this.url, {super.key, this.dimension = 50});
  final String url;
  final double? dimension;

  @override
  Widget build(BuildContext context) {
    double? overall = dimension != null ? dimension! + dimension! * 0.35 : null;
    return SizedBox.square(
      dimension: dimension,
      child: OverflowBox(
        maxWidth: overall,
        minWidth: overall,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Theme.of(context).primaryColor,
            BlendMode.srcIn,
          ),
          child: Lottie.asset(url),
        ),
      ),
    );
  }
}
