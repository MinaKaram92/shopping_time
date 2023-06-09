import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_time/constants.dart';

enum SnackStatus { fail, success }

void showSnack(BuildContext context, SnackStatus status, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: status.index == 0 ? Colors.redAccent : Colors.green,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  ));
}

IconButton backArrow(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.arrow_back_ios_new, color: Color(appSecondaryColor)),
    onPressed: () {
      GoRouter.of(context).pop();
    },
  );
}