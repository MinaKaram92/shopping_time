import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/core/widgets/custom_material_button.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_states.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/custom_auth_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomAuthTextFormField(
            validateMode: AutovalidateMode.onUserInteraction,
            textController: emailController,
            hintText: 'Email',
            prefixIcon: Icons.email,
            inputType: TextInputType.emailAddress,
            contentPadding: const EdgeInsets.only(left: 50.0),
            hintStyle: AppTextStyles.textStyle20,
            validate: (value) {
              if (value?.isEmpty ?? true) {
                return 'please enter your email';
              }
              return null;
            },
          ),
          BlocBuilder<AuthCubit, AuthStates>(
            builder: (context, state) {
              return CustomAuthTextFormField(
                validateMode: AutovalidateMode.onUserInteraction,
                textController: passwordController,
                hintText: 'Password',
                isSecure: BlocProvider.of<AuthCubit>(context).passwordVisible,
                contentPadding: const EdgeInsets.only(left: 50.0),
                hintStyle: AppTextStyles.textStyle20,
                prefixIcon: Icons.lock,
                suffix: TextButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).showPassword();
                  },
                  child: Text(
                    BlocProvider.of<AuthCubit>(context).passwordVisible
                        ? 'Show'
                        : 'Hide',
                    style: const TextStyle(color: Color(appSecondaryColor)),
                  ),
                ),
                inputType: TextInputType.visiblePassword,
                validate: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'please enter your password';
                  }
                  return null;
                },
              );
            },
          ),
          CustomMaterialButton(
              text: 'Sign in',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AuthCubit>(context)
                      .signInWithEmailAndPassword(
                          emailController.text, passwordController.text);
                }
              }),
        ],
      ),
    );
  }
}
