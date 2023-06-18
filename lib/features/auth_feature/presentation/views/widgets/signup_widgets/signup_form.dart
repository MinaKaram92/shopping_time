import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/models/user_model/user_model.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/core/widgets/custom_material_button.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_states.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/custom_auth_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomAuthTextFormField(
            validateMode: AutovalidateMode.onUserInteraction,
            hintText: 'Name',
            contentPadding: const EdgeInsets.only(left: 50.0),
            hintStyle: AppTextStyles.textStyle20,
            prefixIcon: Icons.person,
            textController: nameController,
            inputType: TextInputType.name,
            validate: (value) {
              if (value?.isEmpty ?? true) {
                return 'please enter your name';
              }
              return null;
            },
          ),
          CustomAuthTextFormField(
              hintText: 'Phone',
              validateMode: AutovalidateMode.onUserInteraction,
              prefixIcon: Icons.phone_android,
              textController: phoneController,
              contentPadding: const EdgeInsets.only(left: 50.0),
              hintStyle: AppTextStyles.textStyle20,
              inputType: TextInputType.phone,
              validate: (value) {
                if (value?.isEmpty ?? true) {
                  return 'please enter your phone';
                }
                return null;
              }),
          CustomAuthTextFormField(
              hintText: 'Email',
              validateMode: AutovalidateMode.onUserInteraction,
              prefixIcon: Icons.email,
              textController: emailController,
              contentPadding: const EdgeInsets.only(left: 50.0),
              hintStyle: AppTextStyles.textStyle20,
              inputType: TextInputType.emailAddress,
              validate: (value) {
                if (value?.isEmpty ?? true) {
                  return 'please enter your email';
                }
                return null;
              }),
          BlocBuilder<AuthCubit, AuthStates>(builder: (context, state) {
            return CustomAuthTextFormField(
              hintText: 'Password',
              prefixIcon: Icons.lock,
              contentPadding: const EdgeInsets.only(left: 50.0),
              hintStyle: AppTextStyles.textStyle20,
              validateMode: AutovalidateMode.onUserInteraction,
              isSecure: cubit.passwordVisible,
              suffix: TextButton(
                onPressed: () {
                  cubit.showPassword();
                },
                child: Text(cubit.passwordVisible ? 'Show' : 'Hide'),
              ),
              textController: passwordController,
              inputType: TextInputType.visiblePassword,
              validate: (value) {
                if (value?.isEmpty ?? true) {
                  return 'please enter your password';
                }
                return null;
              },
            );
          }),
          CustomMaterialButton(
            text: 'Sign up',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final userModel = UserModel(
                    name: nameController.text,
                    phone: phoneController.text,
                    email: emailController.text);
                BlocProvider.of<AuthCubit>(context).signUpWithEmailAndPassword(
                    userModel, passwordController.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
