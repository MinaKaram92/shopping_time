import 'package:flutter/material.dart';
import 'package:shopping_time/features/auth_feature/utils/auth_text_styles.dart';

class LogoWithGreeting extends StatelessWidget {
  const LogoWithGreeting(
      {Key? key,
      required this.image,
      required this.greeting,
      required this.whatToDo})
      : super(key: key);

  final String image;
  final String greeting;
  final String whatToDo;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Center(
          child: Image.asset(
            image,
            width: size.width * 2 / 3,
            height: size.height * 1.2 / 4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 4),
          child: Text(
            greeting,
            style: AuthTextStyles.textStyle25,
          ),
        ),
        Text(
          whatToDo,
          style: AuthTextStyles.textStyle14,
        ),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}
