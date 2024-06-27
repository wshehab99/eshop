import 'package:flutter/material.dart';

import '../../../config/app.dart';
import '../../../resources/colors/app_colors.dart';
import '../../../resources/others/utils.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({
    super.key,
    required this.items,
    this.currentIndex = 0,
    required this.onTap,
  });
  final List<NavBarItem> items;
  final int currentIndex;
  final void Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CustomClipper(),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Utils.width(context) / 12,
          vertical: 7,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1.5,
              spreadRadius: 1.5,
              offset: Offset(0, 0),
              color: AppColors.blackShadow,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < items.length; i++)
              InkWell(
                onTap: () => onTap(i),
                child: AnimatedContainer(
                  duration: AppConfig.animationDelay1,
                  curve: Curves.easeInOut,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox.square(
                        dimension: 30,
                        child: currentIndex == i
                            ? Theme(
                                data: ThemeData(
                                  iconTheme: IconThemeData(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                child: items[i].selectedIcon,
                              )
                            : items[i].icon,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        items[i].label,
                        style: currentIndex == i
                            ? Theme.of(context).textTheme.labelMedium
                            : Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  final double padding = 50;
  final double centerRadius = 25;
  final double cornerRadius = 5;
  final double fabSize = 25;
  @override
  getClip(Size size) {
    double xCenter = (size.width / 2);
    final fabSizeWithPadding = fabSize + padding;

    final Path path = Path();
    path.lineTo((xCenter - (fabSizeWithPadding / 2) - cornerRadius), 0);
    path.quadraticBezierTo(xCenter - (fabSizeWithPadding / 1.6), 0,
        (xCenter - (fabSizeWithPadding / 2)) + cornerRadius, cornerRadius);
    path.lineTo(
        xCenter - centerRadius, (fabSizeWithPadding / 2) - centerRadius);
    path.quadraticBezierTo(xCenter, (fabSizeWithPadding / 1.6),
        xCenter + centerRadius, (fabSizeWithPadding / 2) - centerRadius);
    path.lineTo(
        (xCenter + (fabSizeWithPadding / 2) - cornerRadius), cornerRadius);
    path.quadraticBezierTo(xCenter + (fabSizeWithPadding / 1.6), 0,
        (xCenter + (fabSizeWithPadding / 2) + cornerRadius), 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class NavBarItem {
  String label;
  Widget icon;
  Widget selectedIcon;
  NavBarItem({
    required this.icon,
    required this.label,
    required this.selectedIcon,
  });
}
