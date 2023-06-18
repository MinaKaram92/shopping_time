import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_states.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/providers_auth_form.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/signup_widgets/signup_form.dart';
import 'package:shopping_time/features/auth_feature/utils/auth_constants.dart';

class UserInputSignupWidgets extends StatelessWidget {
  const UserInputSignupWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        showSnackBassedOnSignupState(context, state);
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: authContainerDecoration,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
                left: 8.0,
                right: 8.0,
                bottom: 10.0,
              ),
              child: Column(
                children: [
                  const SignupForm(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Or sign up with'),
                  ),
                  const ProviderAuthForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Have an account?'),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        child: const Text('Sign in'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBassedOnSignupState(BuildContext context, AuthStates state) {
    if (state is SuccessSignUpWithEmailAndPasswordState ||
        state is SuccessGoogleAuthState ||
        state is SuccessFacebookAuthState) {
      showSnack(
          context, SnackStatus.success, 'you are registered successfully');
      GoRouter.of(context).pop();
    } else if (state is FailureSignUpWithEmailAndPasswordState) {
      showSnack(context, SnackStatus.fail, state.errorMessage);
    } else if (state is FailureGoogleAuthState) {
      showSnack(context, SnackStatus.fail, state.errorMessage);
    } else if (state is FailureFacebookAuthState) {
      showSnack(context, SnackStatus.fail, state.errorMessage);
    }
  }
}
