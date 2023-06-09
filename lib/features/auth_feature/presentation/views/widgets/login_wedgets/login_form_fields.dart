import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/widgets/custom_text_form_field.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_states.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            validateMode: AutovalidateMode.onUserInteraction,
            textController: BlocProvider.of<AuthCubit>(context).emailController,
            hintText: 'Email',
            prefixIcon: Icons.email,
            inputType: TextInputType.emailAddress,
            validate: (value) {
              if (value!.isEmpty) {
                return 'please enter your email';
              }
              return null;
            },
          ),
          BlocBuilder<AuthCubit, AuthStates>(
            builder: (context, state) {
              return CustomTextFormField(
                validateMode: AutovalidateMode.onUserInteraction,
                textController:
                    BlocProvider.of<AuthCubit>(context).passwordController,
                hintText: 'Password',
                isSecure: cubit.passwordVisible,
                prefixIcon: Icons.lock,
                suffix: TextButton(
                  onPressed: () {
                    cubit.showPassword();
                  },
                  child: Text(
                    cubit.passwordVisible ? 'Show' : 'Hide',
                    style: const TextStyle(color: Color(appSecondaryColor)),
                  ),
                ),
                inputType: TextInputType.visiblePassword,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your password';
                  }
                  return null;
                },
              );
            },
          )
        ],
      ),
    );
  }
}
