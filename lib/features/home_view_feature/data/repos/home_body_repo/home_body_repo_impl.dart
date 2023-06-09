import 'package:dio/dio.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shopping_time/core/network/remote/remote_api_repo_impl.dart';
import 'package:shopping_time/features/home_view_feature/data/repos/home_body_repo/home_body_repo.dart';

class HomeBodyRepoImpl implements HomeBodyRepo {
  const HomeBodyRepoImpl(this._apiRepoImpl);
  final RemoteApiRepoImpl _apiRepoImpl;

  @override
  Future<Either<Failure, List<ProductModel>>> getHomeBodyProducts() async {
    try {
      var products = await _apiRepoImpl.getData('products');
      List<ProductModel> productsList = [];

      for (var product in products.data) {
        productsList.add(ProductModel.fromJson(product));
      }
      return right(productsList);
    } on DioError catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getCategoryProducts(
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
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductDetails(int id) async {
    try {
      var response = await _apiRepoImpl.getData('products/$id');
      ProductModel productModel = ProductModel.fromJson(response.data);
      return right(productModel);
    } on DioError catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
