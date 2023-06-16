import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/network/local/cache_helper.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_cubit.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_methods/auth_method.dart';

class EmailAndPasswordLoginMethod implements AuthMethod {
  @override
  Future<void> authUser() async {
    await loginWithEmailAndPassword();
  }

  EmailAndPasswordLoginMethod({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  Future<void> loginWithEmailAndPassword() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    saveUserId(user.user!.uid);
    
  }

  void saveUserId(String id) {
    CacheHelper.saveData('userId', id);
  }
}
