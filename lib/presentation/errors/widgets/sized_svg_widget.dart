import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/others/size_manager.dart';

class SizedSvg extends StatelessWidget {
  const SizedSvg(
    this.imgPath, {
    super.key,
    this.dimension = SizeManager.s25,
    this.color,
  });

  final double dimension;
  final String imgPath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: SvgPicture.asset(
        imgPath,
        colorFilter: ColorFilter.mode(
          color ?? Theme.of(context).primaryColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
