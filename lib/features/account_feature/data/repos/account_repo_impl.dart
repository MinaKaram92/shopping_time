import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_time/core/constants/firebase_consts.dart';
import 'package:shopping_time/core/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shopping_time/core/models/user_model/user_model.dart';
import 'package:shopping_time/features/account_feature/data/repos/account_repo.dart';

class AccountRepoImpl implements AccountRepo {
  @override
  Future<Either<CustomFailure, UserModel>> getUserData() async {
    try {
      var userDocumentSnapshot = await firestore
          .collection(usersCollection)
          .doc(currentUser?.uid)
          .get();
      UserModel user = UserModel.fromJson(userDocumentSnapshot.data()!);
      return right(user);
    } on FirebaseException catch (e) {
      return left(CustomFailure(e.code));
    } on DioError catch (e) {
      return left(CustomFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<CustomFailure, void>> updateUserData(
      String key, String value) async {
    try {
      await firestore
          .collection(usersCollection)
          .doc(currentUser?.uid)
          .update({key: value});
      return right(null);
    } on FirebaseException catch (e) {
      return left(CustomFailure(e.code));
    } on DioError catch (e) {
      return left(CustomFailure.fromDioError(e));
    }
  }
}
