import 'package:flutter/material.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/core/widgets/custom_text_form_field.dart';

class CustomAuthTextFormField extends StatelessWidget {
  const CustomAuthTextFormField({
    Key? key,
    required this.hintText,
    required this.textController,
    this.prefixIcon,
    this.inputType,
    this.validate,
    this.isSecure = false,
    this.suffix,
    this.validateMode = AutovalidateMode.disabled,
    required this.contentPadding,
    required this.hintStyle,
  }) : super(key: key);

  final String hintText;
  final IconData? prefixIcon;
  final TextEditingController? textController;
  final TextInputType? inputType;
  final String? Function(String?)? validate;
  final bool isSecure;
  final AutovalidateMode? validateMode;
  final Widget? suffix;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle hintStyle;

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
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(appSecondaryColor)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(appSecondaryColor)),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(appSecondaryColor)),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  contentPadding: contentPadding,
                  textController: textController,
                  hintStyle: hintStyle,
                  inputType: inputType,
                  isSecure: isSecure,
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
