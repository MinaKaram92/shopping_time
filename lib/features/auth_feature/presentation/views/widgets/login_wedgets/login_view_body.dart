import 'package:flutter/material.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/login_wedgets/user_input_login_widgets.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/page_header.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: PageHeader(
            image: 'assets/images/in.png',
            title: 'Hi, Welcome Back!',
            subtitle: 'Sign in to your account',
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: UserInputLoginWidgets(),
        )
      ],
    );
  }
}
