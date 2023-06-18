import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_time/core/constants/firebase_consts.dart';
import 'package:shopping_time/core/error_handling/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:shopping_time/core/models/user_model/user_model.dart';
import 'package:shopping_time/features/auth_feature/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<CustomFailure, User?>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(userCredential.user);
    } on FirebaseAuthException catch (e) {
      return left(CustomFailure(e.code));
    } on DioError catch (e) {
      return left(CustomFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<CustomFailure, User?>> authFacebookSignIn() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential =
          await auth.signInWithCredential(facebookAuthCredential);
      return right(userCredential.user);
    } on FirebaseAuthException catch (e) {
      return left(CustomFailure(e.code));
    } on DioError catch (e) {
      return left(CustomFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<CustomFailure, User?>> authGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      return right(userCredential.user);
    } on FirebaseAuthException catch (e) {
      return left(CustomFailure(e.code));
    } on DioError catch (e) {
      return left(CustomFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<CustomFailure, void>> registerUserWithEmailAndPassword(
      UserModel userModel, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: userModel.email, password: password);
      await saveUserInFireStore(userCredential.user, userModel);
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(CustomFailure(e.code));
    } on DioError catch (e) {
      return left(CustomFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<CustomFailure, void>> saveUserInFireStore(
      User? user, UserModel userModel) async {
    try {
      await firestore
          .collection(usersCollection)
          .doc(user?.uid)
          .set(userModel.toJson());
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(CustomFailure(e.code));
    } on DioError catch (e) {
      return left(CustomFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<CustomFailure, void>> signOutUser() async {
    try {
      await auth.signOut();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(CustomFailure(e.code));
    } on DioError catch (e) {
      return left(CustomFailure.fromDioError(e));
    }
  }
}
