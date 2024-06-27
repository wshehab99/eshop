import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/product.dart';
import '../../../domain/repository/main/main_repository.dart';
import 'main_states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit(this._repository) : super(InitialMainState());
  final MainRepository _repository;
  int currentIndex = 0;
  void changeNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeNavBarIndexMainState());
  }

  List<Product> products = [];
  List<String> categories = [];
  void getProducts() async {
    emit(MainLoading());
    (await _repository.productIndex())
        .fold((l) => emit(MainError(l.toBase(getProducts))), (r) {
      products = r;
      emit(MainView());
    });
  }

  void getCategories() async {
    emit(MainLoading());
    (await _repository.productIndex())
        .fold((l) => emit(MainError(l.toBase(getProducts))), (r) {
      products = r;
      emit(MainView());
    });
  }

  void initHome() async {
    emit(MainLoading());
    (await _repository.home())
        .fold((l) => emit(MainError(l.toBase(getProducts))), (r) {
      products = r.products;
      categories = r.categories;
      emit(MainView());
    });
  }
}
