import 'package:flutter/material.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/login_wedgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(appPrimaryColor),
      body: SafeArea(child: LoginViewBody()),
    );
  }
}
