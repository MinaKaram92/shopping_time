import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.textController,
    required this.border,
    required this.errorBorder,
    required this.focusedBorder,
    required this.focusedErrorBorder,
    required this.enabledBorder,
    this.validateMode = AutovalidateMode.disabled,
    this.isSecure = false,
    this.prefixIcon,
    this.inputType,
    this.validate,
    this.suffix,
    this.contentPadding,
    this.hintStyle,
  }) : super(key: key);

  final String hintText;
  final IconData? prefixIcon;
  final TextEditingController? textController;
  final TextInputType? inputType;
  final String? Function(String?)? validate;
  final bool isSecure;
  final AutovalidateMode? validateMode;
  final Widget? suffix;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final InputBorder border;
  final InputBorder errorBorder;
  final InputBorder focusedBorder;
  final InputBorder focusedErrorBorder;
  final InputBorder enabledBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      autovalidateMode: validateMode,
      validator: validate,
      obscureText: isSecure,
      controller: textController,
      decoration: InputDecoration(
        helperText: '',
        prefixIcon: Icon(prefixIcon),
        contentPadding: contentPadding,
        border: border,
        errorBorder: errorBorder,
        focusedBorder: focusedBorder,
        focusedErrorBorder: focusedErrorBorder,
        enabledBorder: enabledBorder,
        hintText: hintText,
        hintStyle: hintStyle,
        suffixIcon: suffix,
      ),
    );
  }
}
