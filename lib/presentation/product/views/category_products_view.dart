import 'package:eshop/app/localization/app_localization.dart';
import 'package:eshop/presentation/product/bloc/product_cubit.dart';
import 'package:eshop/resources/base/base_bloc_builder.dart';
import 'package:eshop/resources/colors/app_colors.dart';
import 'package:eshop/resources/others/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main/widgets/product_widget.dart';

class CategoryProductsView extends StatefulWidget {
  const CategoryProductsView(this.category, {super.key});
  final String category;
  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView> {
  @override
  void initState() {
    context.read<ProductCubit>().categoryProducts(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringManager.categoryProducts.translate(context)),
      ),
      body: BaseBlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
        ProductCubit cubit = context.read<ProductCubit>();
        return SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 5,
                runSpacing: 1,
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    StringManager.productsIn.translate(context),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: AppColors.lightBlack,
                        ),
                  ),
                  Text(
                    widget.category,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) =>
                    ProductWidget(cubit.products[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: cubit.products.length,
              ),
            ],
          ),
        );
      }),
    );
  }
}
