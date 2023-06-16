import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/cupertino.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/models/user_model/user_model.dart';
import 'package:shopping_time/core/network/local/cache_helper.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_states.dart';

class AccountCubit extends Cubit<AccountStates> {
  AccountCubit() : super(InitialAccountState());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  UserModel? user;

  Future<void> getUserData() async {
    emit(LoadingGetUserAccountState());
    try {
      var userDocumentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .get();
      user = UserModel.fromJson(userDocumentSnapshot.data()!);
      storeDataInControllers();
      emit(SuccessGetUserDataState());
    } on FirebaseException catch (e) {
      print(e.code);
      emit(FailureGetUserDataState(e.code));
    } catch (e) {
      print(e.toString());
      emit(FailureGetUserDataState(e.toString()));
    }
  }

  void storeDataInControllers() {
    nameController.text = user!.name;
    emailController.text = user!.email;
    phoneController.text = user!.phone;
  }

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  void updateProfileImage(ImageSource source) async {
    try {
      XFile? pickedImage = await _picker.pickImage(source: source);
      if (pickedImage != null) {
        _profileImage = File(pickedImage.path);
        _uploadProfileImage();
        emit(SuccessPickImageState());
      }
    } catch (e) {
      emit(FailurePickImageState(e.toString()));
    }
  }

  Future<void> _uploadProfileImage() async {
    try {
      Reference reference = FirebaseStorage.instance.ref().child(
          'ProfileImages/$currentUserId/${path.basename(_profileImage!.path)}');
      TaskSnapshot task = await reference.putFile(_profileImage!);
      String imageUrl = await task.ref.getDownloadURL();
      updateUserData(key: 'image', value: imageUrl);
      emit(SuccessUploadProfileImageState());
    } catch (e) {
      emit(FailureUploadProfileImageState(e.toString()));
    }
  }

  Future<void> updateEmail(String email) async {
    try {
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      updateUserData(key: 'email', value: email);
      emit(SuccessUpdateEmailState());
    } catch (e) {
      emit(FailureUpdateEmailState(e.toString()));
    }
  }

  Future<void> updateUserData(
      {required String key, required String value}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .update({key: value});
      emit(SuccessUpdateUserDataState());
    } catch (e) {
      emit(FailureUpdateUserDataState(e.toString()));
    }
  }

  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await CacheHelper.deleteData('userId');
      emit(SuccessSignOutState());
    } catch (e) {
      emit(FailureSignOutState(e.toString()));
    }
  }
}
