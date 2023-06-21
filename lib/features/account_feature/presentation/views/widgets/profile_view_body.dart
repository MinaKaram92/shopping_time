import 'package:flutter/material.dart';
import 'package:shopping_time/features/account_feature/presentation/views/widgets/profile_photo.dart';
import 'package:shopping_time/features/account_feature/presentation/views/widgets/profile_fields_items.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProfilePhoto(),
        ProfileFieldsItems(),
      ],
    );
  }
}
