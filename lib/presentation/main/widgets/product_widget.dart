import 'package:eshop/domain/models/product.dart';
import 'package:flutter/material.dart';

import '../../../app/support/helpers.dart';
import '../../../resources/others/size_manager.dart';
import '../../../resources/routing/route_manager.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(this.product, {super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Material(
        borderRadius: BorderRadius.circular(SizeManager.s10),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () =>
              redirect(context, RouteManager.productDetails, args: product.id),
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeManager.s10),
                ),
                child: Image.network(
                  product.image,
                  fit: BoxFit.fitHeight,
                  height: width(context),
                  width: width(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      product.category,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            product.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(product.rating.rate.toString()),
                            Icon(
                              Icons.star_half,
                              color: Theme.of(context).primaryColor,
                              size: 15,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "${product.rating.count} reviews",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
