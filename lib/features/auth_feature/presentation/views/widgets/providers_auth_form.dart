import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/widgets/provider_auth_form_item.dart';

class ProviderAuthForm extends StatelessWidget {
  const ProviderAuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProviderAuthFormItem(
            image: 'assets/images/google.png',
            onTap: () {
              BlocProvider.of<AuthCubit>(context).googleAuth();
            }),
        const SizedBox(
          width: 30.0,
        ),
        ProviderAuthFormItem(
            image: 'assets/images/facebook.png',
            onTap: () {
              BlocProvider.of<AuthCubit>(context).facebookAuth();
            }),
      ],
    );
  }
}
