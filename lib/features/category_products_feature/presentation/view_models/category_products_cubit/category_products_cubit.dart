import 'package:bloc/bloc.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/features/category_products_feature/presentation/view_models/category_products_cubit/category_products_states.dart';
import 'package:shopping_time/features/home_view_feature/data/repos/home_body_repo/home_body_repo.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsStates> {
  CategoryProductsCubit(this.homeBodyRepo)
      : super(InitialCategoryProductsState());

  final HomeBodyRepo homeBodyRepo;

  List<ProductModel> categoryProductsList = [];

  Future<void> getCategoryProducts(String category) async {
    var response = await homeBodyRepo.getCategoryProducts(category);
    response.fold((failure) {
      emit(FailureCategoryProductsState(failure.errorMessage));
    }, (ctagoryProducts) {
      categoryProductsList = ctagoryProducts;
      emit(SuccessCategoryProductsState());
    });
  }
}