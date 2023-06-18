import 'package:flutter/material.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/signup_widgets/signup_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(appPrimaryColor),
      body: SafeArea(child: SignUpViewBody()),
    );
  }
}
