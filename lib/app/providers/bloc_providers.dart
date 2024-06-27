// ignore: implementation_imports
import 'package:eshop/presentation/product/bloc/product_cubit.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;
import '../../presentation/main/bloc/main_cubit.dart';
import '../bloc/app_cubit.dart';
import '../support/helpers.dart';

class AppBlocProvider {
//all cubits in app
  static final List<SingleChildWidget> cubits = [
    provideBloc<AppCubit>((_) => sl<AppCubit>()),
    provideBloc<MainCubit>((_) => sl<MainCubit>()),
    provideBloc<ProductCubit>((_) => sl<ProductCubit>()),
  ];
}
