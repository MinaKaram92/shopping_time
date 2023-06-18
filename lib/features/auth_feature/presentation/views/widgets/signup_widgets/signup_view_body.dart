import 'package:flutter/material.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/signup_widgets/user_input_signup_widgets.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/page_header.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: PageHeader(
            image: 'assets/images/up.png',
            title: 'Welcome!',
            subtitle: 'Create your account',
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: UserInputSignupWidgets(),
        ),
      ],
    );
  }
}
