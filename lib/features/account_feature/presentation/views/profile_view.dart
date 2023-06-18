import 'package:flutter/material.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/features/account_feature/presentation/views/widgets/profile_photo.dart';
import 'package:shopping_time/features/account_feature/presentation/views/widgets/profile_fields_items.dart';
import 'package:shopping_time/features/account_feature/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(appPrimaryColor),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(appSecondaryColor),
        title: const Text('Profile'),
      ),
      body: const ProfileViewBody(),
    );
  }
}
