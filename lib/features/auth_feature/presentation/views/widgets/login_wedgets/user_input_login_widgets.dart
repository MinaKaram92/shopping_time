import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/core/network/local/cache_helper.dart';
import 'package:shopping_time/core/utils/app_router.dart';
import 'package:shopping_time/core/utils/service_locator.dart';
import 'package:shopping_time/core/widgets/custom_material_button.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_states.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_methods/auth_method.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_methods/facebook_auth.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_methods/google_auth.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/custom_auth_method_item.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/login_wedgets/login_form_fields.dart';
import 'package:shopping_time/features/auth_feature/utils/auth_constants.dart';

import '../../../view_models/auth_methods/email_password_login_method.dart';

class UserInputLoginWidgets extends StatelessWidget {
  const UserInputLoginWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SuccessAuthState) {
          GoRouter.of(context).go(AppRouter.kHomeView);
        } else if (state is FailureAuthState) {
          showSnack(context, SnackStatus.fail, state.errorMessage);
        }
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
              const LoginFormFields(),
              CustomMaterialButton(
                  text: 'Sign in',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      AuthMethod signinMethod = EmailAndPasswordLoginMethod(
                          email: cubit.emailController.text,
                          password: cubit.passwordController.text);
                      customLogin(context, signinMethod);
                    }
                  }),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Or sign in with'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomAuthIcon(
                      image: 'assets/images/g.png',
                      onTap: () {
                        customLogin(context, GoogleAuthMethod());
                      }),
                  const SizedBox(
                    width: 30.0,
                  ),
                  CustomAuthIcon(
                      image: 'assets/images/f.png',
                      onTap: () {
                        customLogin(context, FacebookAuthMethod());
                      }),
                ],
              ),
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

  void customLogin(context, AuthMethod signinMethod) {
    BlocProvider.of<AuthCubit>(context).setAuthMethod(signinMethod);
    BlocProvider.of<AuthCubit>(context).performAuthMethod();
  }
}
