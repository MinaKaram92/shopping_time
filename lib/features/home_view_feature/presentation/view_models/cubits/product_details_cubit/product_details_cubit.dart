import 'package:bloc/bloc.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/features/home_view_feature/data/repos/home_body_repo/home_body_repo.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/product_details_cubit/product_details_states.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit(this._homeBodyRepo) : super(InitialProductDetailsState());
  final HomeBodyRepo _homeBodyRepo;
  bool isReadMore = false;

  void readMore() {
    isReadMore = !isReadMore;
    emit(ReadMoreProductDetailsState());
  }

  ProductModel? productModel;

  Future<void> getProductDetails(int id) async {
    var response = await _homeBodyRepo.getProductDetails(id);
    response.fold((failure) {
      emit(FailureProductDetailsState(failure.errorMessage));
    }, (product) {
      productModel = product;
      emit(SuccessProductDetailsState());
    });
  }
}
