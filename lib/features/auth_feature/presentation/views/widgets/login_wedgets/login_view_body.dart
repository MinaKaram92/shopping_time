import 'package:flutter/material.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/login_wedgets/user_input_login_widgets.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/logo_with_greeting.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: LogoWithGreeting(
              image: 'assets/images/in.png',
              greeting: 'Hi, Welcome Back!',
              whatToDo: 'Sign in to your account'),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: UserInputLoginWidgets(),
        )
      ],
    );
  }
}
