import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/core/utils/app_router.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_cubit.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_states.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/login_wedgets/login_form.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/providers_auth_form.dart';
import 'package:shopping_time/features/auth_feature/utils/auth_constants.dart';

class UserInputLoginWidgets extends StatelessWidget {
  const UserInputLoginWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        showSnackBasedOnLoginState(context, state);
      },
      child: Container(
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
              const LoginForm(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Or sign in with'),
              ),
              const ProviderAuthForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an accont?'),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kRegister);
                    },
                    child: const Text('Signup here'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBasedOnLoginState(BuildContext context, AuthStates state) {
    if (state is SuccessLoginEmailAndPasswordState) {
      BlocProvider.of<AccountCubit>(context).getUserData();
      GoRouter.of(context).go(AppRouter.kAppLayout);
    } else if (state is FailureLoginEmailAndPasswordState) {
      showSnack(context, SnackStatus.fail, state.errorMessage);
    } else if (state is FailureGoogleAuthState) {
      showSnack(context, SnackStatus.fail, state.errorMessage);
    } else if (state is FailureGoogleAuthState) {
      showSnack(context, SnackStatus.fail, state.errorMessage);
    }
  }
}
