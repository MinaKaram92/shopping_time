import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HaveAccountSignin extends StatelessWidget {
  const HaveAccountSignin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Have an account?'),
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: const Text('Sign in'),
        ),
      ],
    );
  }
}
