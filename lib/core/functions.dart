import 'package:flutter/material.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/core/widgets/custom_text_form_field.dart';

enum SnackStatus { fail, success }

void showSnack(BuildContext context, SnackStatus status, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    behavior: SnackBarBehavior.floating,
    backgroundColor: status.index == 0 ? Colors.redAccent : Colors.green,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  ));
}

AlertDialog showAlertDialog(BuildContext context,
    {required String content, required VoidCallback okPressed}) {
  return AlertDialog(
    title: const Text('Warning'),
    content: Text(content),
    actions: [
      TextButton(
        onPressed: okPressed,
        child: const Text('Ok'),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Cancel'),
      ),
    ],
  );
}
