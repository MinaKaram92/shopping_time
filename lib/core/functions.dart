import 'package:flutter/material.dart';

enum SnackStatus { fail, success }

void showSnack(BuildContext context, SnackStatus status, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
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
