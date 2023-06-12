import 'package:bloc/bloc.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/features/cart_feature/data/models/cart_model.dart';
import 'package:shopping_time/features/home_view_feature/data/repos/home_body_repo/home_body_repo.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/home_body_products_cubit/home_body_products_states.dart';

class HomeBodyProductsCubit extends Cubit<HomeBodyProductsStates> {
  HomeBodyProductsCubit(this._homeBodyProductsRepo)
      : super(InitialHomeBodyProductsState());

  final HomeBodyRepo _homeBodyProductsRepo;

  Future<void> getHomeBodyProducts() async {
    var response = await _homeBodyProductsRepo.getHomeBodyProducts();
    response.fold((failure) {
      emit(FailureHomeBodyProductsState(failure.errorMessage));
    }, (products) {
      productsList = products;
      emit(SuccessHomeBodyProductsState());
    });
  }
}
