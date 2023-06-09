import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/widgets/custom_material_button.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_methods/auth_method.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_methods/email_password_signup_method.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_methods/facebook_auth.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_methods/google_auth.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/custom_auth_method_item.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/signup_widgets/have_account_signin.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/signup_widgets/signup_form_fields.dart';
import 'package:shopping_time/features/auth_feature/utils/auth_constants.dart';

class UserInputSignupWidgets extends StatelessWidget {
  const UserInputSignupWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    return Column(
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
                const SignupFormFields(),
                CustomMaterialButton(
                  text: 'Sign up',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      AuthMethod authMethod = EmailPasswordSignupMethod(
                        cubit.nameController.text,
                        cubit.phoneController.text,
                        cubit.emailController.text,
                        cubit.passwordController.text,
                      );
                      authSignup(context, authMethod);
                    }
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Or sign up with'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomAuthIcon(
                      image: 'assets/images/g.png',
                      onTap: () {
                        authSignup(context, GoogleAuthMethod());
                      },
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    CustomAuthIcon(
                      image: 'assets/images/f.png',
                      onTap: () {
                        authSignup(context, FacebookAuthMethod());
                      },
                    ),
                  ],
                ),
                const HaveAccountSignin(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void authSignup(context, AuthMethod authMethod) {
    BlocProvider.of<AuthCubit>(context).setAuthMethod(authMethod);
    BlocProvider.of<AuthCubit>(context).performAuthMethod();
  }
}
