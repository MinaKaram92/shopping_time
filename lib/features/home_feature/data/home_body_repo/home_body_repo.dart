import 'package:dartz/dartz.dart';
import 'package:shopping_time/core/error_handling/failure.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';

abstract class HomeBodyRepo {
  Future<Either<CustomFailure, List<ProductModel>>> getHomeBodyProducts();

  Future<Either<CustomFailure, List<ProductModel>>> getCategoryProducts(
      String category);
}
