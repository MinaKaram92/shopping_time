import 'package:bloc/bloc.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/features/home_feature/data/home_body_repo/home_body_repo.dart';
import 'package:shopping_time/features/home_feature/presentation/view_models/home_body_products_cubit/home_body_products_states.dart';

class HomeBodyProductsCubit extends Cubit<HomeBodyProductsStates> {
  HomeBodyProductsCubit(this._homeBodyProductsRepo)
      : super(InitialHomeBodyProductsState());

  final HomeBodyRepo _homeBodyProductsRepo;

  Future<void> getHomeBodyProducts() async {
    emit(LoadingHomeBodyProductsState());
    if (productsList.isEmpty) {
      var response = await _homeBodyProductsRepo.getHomeBodyProducts();
      response.fold((failure) {
        emit(FailureHomeBodyProductsState(failure.errMessage));
      }, (products) {
        productsList = products;
        emit(SuccessHomeBodyProductsState());
      });
    }
  }
}
