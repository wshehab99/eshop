import 'package:eshop/app/support/helpers.dart';
import 'package:eshop/presentation/main/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/base/base_bloc_builder.dart';
import '../../bloc/main_cubit.dart';
import '../../bloc/main_states.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBlocBuilder<MainCubit, MainStates>(
      builder: (context, state) {
        MainCubit cubit = context.read();
        return GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: height(context) / width(context),
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (context, index) =>
              CategoryWidget(cubit.categories[index]),
          itemCount: cubit.categories.length,
        );
      },
    );
  }
}
