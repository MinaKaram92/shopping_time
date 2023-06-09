import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/signup_widgets/signup_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(appPrimaryColor),
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: const SafeArea(child: RegisterViewBody()),
      ),
    );
  }
}
