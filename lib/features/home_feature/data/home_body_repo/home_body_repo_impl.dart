import 'package:dio/dio.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shopping_time/core/network/remote/remote_api_repo_impl.dart';
import 'package:shopping_time/features/home_feature/data/home_body_repo/home_body_repo.dart';

class HomeBodyRepoImpl implements HomeBodyRepo {
  const HomeBodyRepoImpl(this._apiRepoImpl);
  final RemoteApiRepoImpl _apiRepoImpl;

  @override
  Future<Either<CustomFailure, List<ProductModel>>>
      getHomeBodyProducts() async {
    try {
      var products = await _apiRepoImpl.getData('products');
      List<ProductModel> productsList = [];

      for (var product in products.data) {
        productsList.add(ProductModel.fromJson(product));
      }
      return right(productsList);
    } on DioError catch (e) {
      return left(CustomFailure.fromDioError(e));
    } catch (e) {
      return left(CustomFailure(e.toString()));
    }
  }

  @override
  Future<Either<CustomFailure, List<ProductModel>>> getCategoryProducts(
      String category) async {
    try {
      var categoryProducts =
          await _apiRepoImpl.getData('products/category/$category');
      List<ProductModel> categoryProductsList = [];

      for (var product in categoryProducts.data) {
        categoryProductsList.add(ProductModel.fromJson(product));
      }
      return right(categoryProductsList);
    } on DioError catch (e) {
      return left(CustomFailure.fromDioError(e));
    } catch (e) {
      return left(CustomFailure(e.toString()));
    }
  }
}
