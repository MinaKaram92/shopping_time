import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/cupertino.dart';
import 'package:shopping_time/core/constants/firebase_consts.dart';
import 'package:shopping_time/core/models/user_model/user_model.dart';
import 'package:shopping_time/features/account_feature/data/repos/account_repo.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_states.dart';

class AccountCubit extends Cubit<AccountStates> {
  AccountCubit(this._accountRepo) : super(InitialAccountState());

  final AccountRepo _accountRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  UserModel? user;

  Future<void> getUserData() async {
    emit(LoadingGetUserAccountState());
    final response = await _accountRepo.getUserData();
    response.fold((failure) {
      emit(FailureGetUserDataState(failure.errMessage));
    }, (userModel) {
      user = userModel;
      emit(SuccessGetUserDataState());
    });
  }

  Future<void> updateUserData(
      {required String key, required String value}) async {
    emit(LoadingUpdateUserDataState());
    final response = await _accountRepo.updateUserData(key, value);
    response.fold((failure) {
      emit(FailureUpdateUserDataState(failure.errMessage));
    }, (_) {
      getUserData();
      emit(SuccessUpdateUserDataState());
    });
  }

  Future<void> updateEmail(String email) async {
    emit(LoadingUpdateEmailState());
    try {
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await updateUserData(key: 'email', value: email);
      emit(SuccessUpdateEmailState());
    } on FirebaseException catch (e) {
      emit(FailureUpdateEmailState(e.code));
    } catch (e) {
      emit(FailureUpdateEmailState(e.toString()));
    }
  }

  final ImagePicker _picker = ImagePicker();

  Future<File?> _pickImage(ImageSource source) async {
    File? profileImage;
    XFile? pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      profileImage = File(pickedImage.path);
    }
    return profileImage;
  }

  Future<String> _uploadProfileImage(File image) async {
    Reference reference = FirebaseStorage.instance.ref().child(
        'ProfileImages/${currentUser?.uid}/${path.basename(image.path)}');
    TaskSnapshot task = await reference.putFile(image);
    return await task.ref.getDownloadURL();
  }

  Future<void> updateProfilePhoto(ImageSource source) async {
    emit(LoadingUpdateProfilePhotoState());
    try {
      File? image = await _pickImage(source);
      if (image != null) {
        String profileImage = await _uploadProfileImage(image);
        await updateUserData(key: 'image', value: profileImage);
      }
      emit(SuccessUpdateProfilePhotoState());
    } catch (e) {
      emit(FailureUpdateProfilePhotoState(e.toString()));
    }
  }
}
