import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/repository/main/main_repository.dart';
import '../../../../domain/repository/product/product_repository.dart';
import '../../../../presentation/main/bloc/main_cubit.dart';
import '../../../../presentation/product/bloc/product_cubit.dart';
import '../../../bloc/app_cubit.dart';
import '../../../observers/bloc_observer.dart';
import '../../../support/helpers.dart';
import '../../../utils/app_preferences.dart';

abstract class BlocInitializer {
  static void setCubits() {
    //observer
    Bloc.observer = MyBlocObserver();
    //cubits
    registerFactory<AppCubit>(
        () => AppCubit(sl<AppPreferences>())..getLocale());
    registerFactory<MainCubit>(() => MainCubit(sl<MainRepository>()));
    registerFactory<ProductCubit>(() => ProductCubit(sl<ProductRepository>()));
  }
}
