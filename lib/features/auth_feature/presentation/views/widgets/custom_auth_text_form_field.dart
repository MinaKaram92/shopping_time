import 'package:flutter/material.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.textController,
    this.prefixIcon,
    this.inputType,
    this.validate,
    this.isSecure = false,
    this.suffix,
    this.validateMode = AutovalidateMode.disabled,
  }) : super(key: key);

  final String hintText;
  final IconData? prefixIcon;
  final TextEditingController? textController;
  final TextInputType? inputType;
  final String? Function(String?)? validate;
  final bool isSecure;
  final AutovalidateMode? validateMode;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: SizedBox(
                height: 80.0,
                child: CustomTextFormField(
                  hintText: hintText,
                  textController: textController,
                  inputType: inputType,
                  isSecure: isSecure,
                  prefixIcon: prefixIcon,
                  suffix: suffix,
                  validate: validate,
                  validateMode: validateMode,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 21.0,
            child: CircleAvatar(
              backgroundColor: const Color(appPrimaryColor),
              radius: 35.0,
              child: Icon(
                prefixIcon,
                color: const Color(appSecondaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
