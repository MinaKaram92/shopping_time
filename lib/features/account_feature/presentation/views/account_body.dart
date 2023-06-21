import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/core/widgets/account_drawer_menu.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_cubit.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_states.dart';
import 'package:shopping_time/features/account_feature/presentation/views/widgets/account_user_details.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
      listener: (context, state) {
        if (state is FailureGetUserDataState) {
          showSnack(context, SnackStatus.fail, state.errMessage);
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is SuccessGetUserDataState,
          builder: (context) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                AccountUserDetails(),
                AccountDrawerMenu(trailing: true),
              ],
            );
          },
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
