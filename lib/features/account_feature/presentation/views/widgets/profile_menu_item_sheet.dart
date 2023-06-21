import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/constants/constants.dart';
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
  }) : super(key: key);

  final String hint;
  final VoidCallback save;
  final TextEditingController controller;
  final TextInputType textInputType;
  final IconData prefix;
  final String? Function(String?)? validate;
  final AutovalidateMode autovalidateMode;

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
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(appSecondaryColor))),
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(appSecondaryColor))),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(appSecondaryColor))),
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
