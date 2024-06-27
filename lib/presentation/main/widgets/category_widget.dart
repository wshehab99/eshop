import 'package:flutter/material.dart';

import '../../../app/support/helpers.dart';
import '../../../resources/colors/app_colors.dart';
import '../../../resources/routing/route_manager.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(this.category, {super.key});
  final String category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          redirect(context, RouteManager.categoryProducts, args: category),
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.blackShadow,
              offset: Offset(0, 0),
              blurRadius: 1.5,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Text(
              category,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: AppColors.lightBlack),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
