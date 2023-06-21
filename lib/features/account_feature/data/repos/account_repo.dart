import 'package:dartz/dartz.dart';
import 'package:shopping_time/core/error_handling/failure.dart';
import 'package:shopping_time/core/models/user_model/user_model.dart';

abstract class AccountRepo {
  Future<Either<CustomFailure, UserModel>> getUserData();

  Future<Either<CustomFailure, void>> updateUserData(String key, String value);
}
