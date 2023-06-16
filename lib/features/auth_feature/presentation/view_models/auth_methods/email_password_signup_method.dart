import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/models/user_model/user_model.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_methods/auth_method.dart';

class EmailPasswordSignupMethod implements AuthMethod {
  @override
  Future<void> authUser() async {
    await signupUser();
  }

  late final UserCredential userCredential;

  EmailPasswordSignupMethod(this.name, this.phone, this.email, this.password);
  final String name;
  final String phone;
  final String email;
  final String password;

  Future<void> signupUser() async {
    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    saveUserInFireStore();
  }

  void saveUserInFireStore() {
    UserModel userModel = UserModel(
      name: name,
      phone: phone,
      email: email,
      image: noProfileImage,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user?.uid)
        .set(userModel.toJson());
  }
}
