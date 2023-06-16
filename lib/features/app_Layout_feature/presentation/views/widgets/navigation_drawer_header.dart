import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_cubit.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_states.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountStates>(builder: (context, state) {
      final cubit = BlocProvider.of<AccountCubit>(context);
      return ConditionalBuilder(
        condition: cubit.user != null,
        builder: (context) {
          return UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(appSecondaryColor)),
            currentAccountPicture: CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: cubit.user!.image ?? noProfileImage,
                ),
              ),
            ),
            accountName: Text(
              cubit.user!.name,
              style: AppTextStyles.textStyle18Bold,
            ),
            accountEmail: Text(
              cubit.user!.email,
            ),
          );
        },
        fallback: (context) => CircularProgressIndicator(),
      );
    });
  }
}
