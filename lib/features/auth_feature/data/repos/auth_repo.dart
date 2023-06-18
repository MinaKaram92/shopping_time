import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_time/core/error_handling/failure.dart';
import 'package:shopping_time/core/models/user_model/user_model.dart';

abstract class AuthRepo {
  Future<Either<CustomFailure, User?>> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<CustomFailure, User?>> authGoogleSignIn();

  Future<Either<CustomFailure, User?>> authFacebookSignIn();

  Future<Either<CustomFailure, void>> registerUserWithEmailAndPassword(
      UserModel userModel, String password);

  Future<Either<CustomFailure, void>> saveUserInFireStore(
      User? user, UserModel userModel);

  Future<Either<CustomFailure, void>> signOutUser();
}
