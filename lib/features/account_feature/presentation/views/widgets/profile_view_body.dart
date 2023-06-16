import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_cubit.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_states.dart';
import 'package:shopping_time/features/account_feature/presentation/views/widgets/profile_photo.dart';
import 'package:shopping_time/features/account_feature/presentation/views/widgets/profile_fields_items.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountStates>(
      builder: (context, state) {
        final cubit = BlocProvider.of<AccountCubit>(context);
        return Column(
          children: [
            ProfilePhoto(cubit: cubit),
            ProfileFieldsItems(cubit: cubit),
          ],
        );
      },
    );
  }
}
