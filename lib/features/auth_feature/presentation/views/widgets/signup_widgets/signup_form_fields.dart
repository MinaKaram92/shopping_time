import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/widgets/custom_text_form_field.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_states.dart';

class SignupFormFields extends StatelessWidget {
  const SignupFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            validateMode: AutovalidateMode.onUserInteraction,
            hintText: 'Name',
            prefixIcon: Icons.person,
            textController: cubit.nameController,
            inputType: TextInputType.name,
            validate: (value) {
              if (value?.isEmpty ?? true) {
                return 'please enter your name';
              }
              return null;
            },
          ),
          CustomTextFormField(
              hintText: 'Phone',
              validateMode: AutovalidateMode.onUserInteraction,
              prefixIcon: Icons.phone_android,
              textController: cubit.phoneController,
              inputType: TextInputType.phone,
              validate: (value) {
                if (value?.isEmpty ?? true) {
                  return 'please enter your name';
                }
                return null;
              }),
          CustomTextFormField(
              hintText: 'Email',
              validateMode: AutovalidateMode.onUserInteraction,
              prefixIcon: Icons.email,
              textController: cubit.emailController,
              inputType: TextInputType.emailAddress,
              validate: (value) {
                if (value?.isEmpty ?? true) {
                  return 'please enter your name';
                }
                return null;
              }),
          BlocBuilder<AuthCubit, AuthStates>(builder: (context, state) {
            return CustomTextFormField(
              hintText: 'Password',
              prefixIcon: Icons.lock,
              validateMode: AutovalidateMode.onUserInteraction,
              isSecure: cubit.passwordVisible,
              suffix: TextButton(
                onPressed: () {
                  cubit.showPassword();
                },
                child: Text(cubit.passwordVisible ? 'Show' : 'Hide'),
              ),
              textController: cubit.passwordController,
              inputType: TextInputType.visiblePassword,
              validate: (value) {
                if (value?.isEmpty ?? true) {
                  return 'please enter your name';
                }
                return null;
              },
            );
          }),
        ],
      ),
    );
  }
}
