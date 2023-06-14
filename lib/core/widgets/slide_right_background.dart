import 'package:flutter/material.dart';

class SlideRightBackground extends StatelessWidget {
  const SlideRightBackground(
      {Key? key, required this.slideRightIcon, required this.slideRightText})
      : super(key: key);

  final IconData slideRightIcon;
  final String slideRightText;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Row(
        children: [
          const SizedBox(
            width: 16.0,
          ),
          Icon(
            slideRightIcon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            slideRightText,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
