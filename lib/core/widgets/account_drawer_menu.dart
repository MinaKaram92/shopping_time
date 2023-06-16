import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/network/local/cache_helper.dart';
import 'package:shopping_time/core/utils/app_router.dart';
import 'package:shopping_time/core/widgets/menu_navigation_item.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_cubit.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_states.dart';

class AccountDrawerMenu extends StatelessWidget {
  const AccountDrawerMenu({Key? key, required this.trailing}) : super(key: key);
  final bool trailing;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountCubit, AccountStates>(
      listener: (context, state) async {
        if (state is SuccessSignOutState) {
          GoRouter.of(context).go(AppRouter.kLogin);
        }
      },
      child: Column(
        children: [
          MenuNavigationItem(
            title: 'Profile',
            leading: Icons.person,
            onTap: () {
              GoRouter.of(context).push(AppRouter.kProfileView);
            },
            trailing: trailing ? Icons.arrow_forward : null,
          ),
          MenuNavigationItem(
            title: 'Shipping Address',
            leading: Icons.location_pin,
            onTap: () {
              GoRouter.of(context).push(AppRouter.kShippingAddressView);
            },
            trailing: trailing ? Icons.arrow_forward : null,
          ),
          MenuNavigationItem(
            title: 'Order History',
            leading: Icons.history,
            onTap: () {
              GoRouter.of(context).push(AppRouter.kOrderHistoryView);
            },
            trailing: trailing ? Icons.arrow_forward : null,
          ),
          MenuNavigationItem(
            title: 'Cards',
            leading: Icons.credit_card,
            onTap: () {
              GoRouter.of(context).push(AppRouter.kCardsView);
            },
            trailing: trailing ? Icons.arrow_forward : null,
          ),
          MenuNavigationItem(
            title: 'Sign Out',
            leading: Icons.logout,
            onTap: () {
              BlocProvider.of<AccountCubit>(context).signOut();
            },
            trailing: trailing ? Icons.arrow_forward : null,
          )
        ],
      ),
    );
  }
}
