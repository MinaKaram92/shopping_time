import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_states.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/signup_widgets/user_input_signup_widgets.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/logo_with_greeting.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SuccessAuthState) {
          showSnack(
              context, SnackStatus.success, 'you are registered successfully');
          GoRouter.of(context).pop();
        } else if (state is FailureAuthState) {
          showSnack(context, SnackStatus.fail, state.errorMessage);
        }
      },
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: LogoWithGreeting(
              image: 'assets/images/up.png',
              greeting: 'Welcome!',
              whatToDo: 'Create your account',
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: UserInputSignupWidgets(),
          ),
        ],
      ),
    );
  }
}
