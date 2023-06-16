import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/core/widgets/custom_text_form_field.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_cubit.dart';

class ProfileMenuItemSheet extends StatelessWidget {
  const ProfileMenuItemSheet({
    Key? key,
    required this.hint,
    required this.save,
    required this.controller,
    required this.textInputType,
    required this.prefix,
    required this.autovalidateMode,
    this.validate,
    required this.border,
    required this.errorBorder,
    required this.focusedBorder,
    required this.focusedErrorBorder,
    required this.enabledBorder,
  }) : super(key: key);

  final String hint;
  final VoidCallback save;
  final TextEditingController controller;
  final TextInputType textInputType;
  final IconData prefix;
  final String? Function(String?)? validate;
  final AutovalidateMode autovalidateMode;
  final InputBorder border;
  final InputBorder errorBorder;
  final InputBorder focusedBorder;
  final InputBorder focusedErrorBorder;
  final InputBorder enabledBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16.0,
        right: 16.0,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: BlocProvider.of<AccountCubit>(context).formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                hintText: hint,
                textController: controller,
                border: border,
                errorBorder: errorBorder,
                focusedBorder: focusedBorder,
                focusedErrorBorder: focusedErrorBorder,
                enabledBorder: enabledBorder,
                prefixIcon: prefix,
                inputType: textInputType,
                validate: validate,
                validateMode: autovalidateMode,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: AppTextStyles.textStyle18Reg.copyWith(
                        color: const Color(
                          appSecondaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24.0,
                  ),
                  TextButton(
                    onPressed: save,
                    child: Text(
                      'Save',
                      style: AppTextStyles.textStyle18Reg.copyWith(
                        color: const Color(
                          appSecondaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
