import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/core/widgets/menu_navigation_item.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_cubit.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_states.dart';
import 'package:shopping_time/features/account_feature/presentation/views/widgets/profile_menu_item_sheet.dart';

class ProfileFieldsItems extends StatelessWidget {
  const ProfileFieldsItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
      listener: (context, state) {
        if (state is FailureUpdateEmailState) {
          showSnack(context, SnackStatus.fail, state.errMessage);
        } else if (state is FailureUpdateUserDataState) {
          showSnack(context, SnackStatus.fail, state.errMessage);
        }
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<AccountCubit>(context);
        return Column(
          children: [
            MenuNavigationItem(
              title: 'Name',
              subtitle: cubit.user!.name,
              subtitleStyle: AppTextStyles.textStyle18,
              leading: Icons.person,
              trailing: Icons.edit,
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      cubit.nameController.text = cubit.user?.name ?? '';
                      return ProfileMenuItemSheet(
                        hint: 'Name',
                        controller: cubit.nameController,
                        prefix: Icons.person,
                        textInputType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validate: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter your name';
                          }
                          return null;
                        },
                        save: () async {
                          if (cubit.formKey.currentState!.validate()) {
                            await cubit.updateUserData(
                                key: 'name', value: cubit.nameController.text);
                          }
                        },
                      );
                    });
              },
            ),
            MenuNavigationItem(
              title: 'Email',
              subtitle: cubit.user!.email,
              subtitleStyle: AppTextStyles.textStyle18,
              leading: Icons.email,
              trailing: Icons.edit,
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      cubit.emailController.text = cubit.user?.email ?? '';
                      return ProfileMenuItemSheet(
                        hint: 'Email',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        prefix: Icons.email,
                        textInputType: TextInputType.emailAddress,
                        validate: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter your email';
                          }
                          return null;
                        },
                        save: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.updateEmail(cubit.emailController.text);
                          }
                        },
                        controller: cubit.emailController,
                      );
                    });
              },
            ),
            MenuNavigationItem(
              title: 'Phone',
              subtitle: cubit.user!.phone,
              subtitleStyle: AppTextStyles.textStyle18,
              leading: Icons.phone,
              trailing: Icons.edit,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    cubit.phoneController.text = cubit.user?.phone ?? '';
                    return ProfileMenuItemSheet(
                      hint: 'Phone',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      prefix: Icons.phone,
                      textInputType: TextInputType.phone,
                      validate: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your phone';
                        }
                        return null;
                      },
                      save: () async {
                        if (cubit.formKey.currentState!.validate()) {
                          await cubit.updateUserData(
                              key: 'phone', value: cubit.phoneController.text);
                        }
                      },
                      controller: cubit.phoneController,
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
