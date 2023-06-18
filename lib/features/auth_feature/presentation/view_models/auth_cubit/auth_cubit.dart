import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/constants/firebase_consts.dart';
import 'package:shopping_time/core/models/user_model/user_model.dart';
import 'package:shopping_time/features/auth_feature/data/repos/auth_repo.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this._authRepo) : super(InitialAuthState());

  final AuthRepo _authRepo;

  bool passwordVisible = true;

  void showPassword() {
    passwordVisible = !passwordVisible;
    emit(ShowPasswordState());
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(LoadingLoginEmailAndPasswordState());
    var response = await _authRepo.loginWithEmailAndPassword(
        email: email, password: password);
    response.fold((failure) {
      emit(FailureLoginEmailAndPasswordState(failure.errMessage));
    }, (user) {
      currentUser = user;
      emit(SuccessLoginEmailAndPasswordState());
    });
  }

  Future<void> signUpWithEmailAndPassword(
      UserModel userModel, String password) async {
    emit(LoadingSignUpEmailAndPasswordState());
    var response =
        await _authRepo.registerUserWithEmailAndPassword(userModel, password);
    response.fold((failure) {
      emit(FailureSignUpWithEmailAndPasswordState(failure.errMessage));
    }, (_) {
      emit(SuccessSignUpWithEmailAndPasswordState());
    });
  }

  Future<void> googleAuth() async {
    emit(LoadingGoogleAuthState());
    var response = await _authRepo.authGoogleSignIn();
    response.fold((failure) {
      emit(FailureGoogleAuthState(failure.errMessage));
    }, (user) {
      currentUser = user;
      emit(SuccessGoogleAuthState());
    });
  }

  Future<void> facebookAuth() async {
    emit(LoadingFacebookAuthState());
    var response = await _authRepo.authFacebookSignIn();
    response.fold((failure) {
      emit(FailureFacebookAuthState(failure.errMessage));
    }, (user) {
      currentUser = user;
      emit(SuccessFacebookAuthState());
    });
  }

  Future<void> signOut() async {
    var response = await _authRepo.signOutUser();
    response.fold((failure) {
      emit(FailureSignOutUserState(failure.errMessage));
    }, (_) {
      emit(SuccessSignOutUserState());
    });
  }
}
