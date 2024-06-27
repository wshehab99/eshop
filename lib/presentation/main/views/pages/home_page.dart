import 'package:eshop/presentation/main/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../resources/base/base_bloc_builder.dart';
import '../../bloc/main_cubit.dart';
import '../../bloc/main_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBlocBuilder<MainCubit, MainStates>(
      builder: (context, state) {
        MainCubit cubit = context.read();
        return ListView.separated(
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index) => ProductWidget(cubit.products[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: cubit.products.length,
        );
      },
    );
  }
}
