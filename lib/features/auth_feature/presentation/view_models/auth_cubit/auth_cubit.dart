import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_states.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_methods/auth_method.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(InitialAuthState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  AuthMethod? _authMethod;

  bool passwordVisible = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void showPassword() {
    passwordVisible = !passwordVisible;
    emit(ShowPasswordState());
  }

  setAuthMethod(AuthMethod authMethod) {
    _authMethod = authMethod;
  }

  void performAuthMethod() async {
    try {
      await _authMethod?.authUser();
      emit(SuccessAuthState());
    } on FirebaseException catch (e) {
      print(e.toString());
      emit(FailureAuthState(e.code));
    } catch (e) {
      print(e.toString());
      emit(FailureAuthState(e.toString()));
    }
  }
}
