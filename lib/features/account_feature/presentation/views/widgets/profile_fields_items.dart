import 'package:flutter/material.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/core/widgets/menu_navigation_item.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_cubit.dart';
import 'package:shopping_time/features/account_feature/presentation/views/widgets/profile_menu_item_sheet.dart';

class ProfileFieldsItems extends StatelessWidget {
  const ProfileFieldsItems({Key? key, required this.cubit}) : super(key: key);
  final AccountCubit cubit;

  @override
  Widget build(BuildContext context) {
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
                  return ProfileMenuItemSheet(
                    hint: 'Name',
                    border: textFormFieldBorder(
                        borderColor: const Color(appSecondaryColor)),
                    enabledBorder: textFormFieldBorder(
                        borderColor: const Color(appSecondaryColor)),
                    focusedBorder: textFormFieldBorder(
                        borderColor: const Color(appSecondaryColor)),
                    errorBorder: textFormFieldBorder(borderColor: Colors.red),
                    focusedErrorBorder:
                        textFormFieldBorder(borderColor: Colors.red),
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
                  return ProfileMenuItemSheet(
                    hint: 'Email',
                    border: textFormFieldBorder(
                        borderColor: const Color(appSecondaryColor)),
                    enabledBorder: textFormFieldBorder(
                        borderColor: const Color(appSecondaryColor)),
                    focusedBorder: textFormFieldBorder(
                        borderColor: const Color(appSecondaryColor)),
                    errorBorder: textFormFieldBorder(borderColor: Colors.red),
                    focusedErrorBorder:
                        textFormFieldBorder(borderColor: Colors.red),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    prefix: Icons.email,
                    textInputType: TextInputType.emailAddress,
                    validate: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                    save: () async {
                      if (cubit.formKey.currentState!.validate()) {
                        await cubit.updateEmail(cubit.emailController.text);
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
                return ProfileMenuItemSheet(
                  border: textFormFieldBorder(
                      borderColor: const Color(appSecondaryColor)),
                  enabledBorder: textFormFieldBorder(
                      borderColor: const Color(appSecondaryColor)),
                  focusedBorder: textFormFieldBorder(
                      borderColor: const Color(appSecondaryColor)),
                  errorBorder: textFormFieldBorder(borderColor: Colors.red),
                  focusedErrorBorder:
                      textFormFieldBorder(borderColor: Colors.red),
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
  }

  UnderlineInputBorder textFormFieldBorder({required Color borderColor}) {
    return UnderlineInputBorder(borderSide: BorderSide(color: borderColor));
  }
}
