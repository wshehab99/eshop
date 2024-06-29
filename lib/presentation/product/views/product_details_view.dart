import 'package:eshop/app/localization/app_localization.dart';
import 'package:eshop/app/support/helpers.dart';
import 'package:eshop/presentation/product/bloc/product_cubit.dart';
import 'package:eshop/resources/base/base_bloc_builder.dart';
import 'package:eshop/resources/others/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView(this.id, {super.key});
  final int id;
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  void initState() {
    context.read<ProductCubit>().showProduct(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BaseBlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
        ProductCubit cubit = context.read<ProductCubit>();
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                cubit.product.image,
                height: width(context),
                width: width(context),
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 15),
              Text(
                cubit.product.category,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 5),
              Text(
                cubit.product.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 15),
              Text(
                StringManager.details.translate(context),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                cubit.product.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(cubit.product.rating.rate.toString()),
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
                    "${cubit.product.rating.count} reviews",
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
