import 'package:flutter/material.dart';

class SlideRightBackground extends StatelessWidget {
  const SlideRightBackground(
      {Key? key, required this.iconData, required this.text})
      : super(key: key);

  final IconData iconData;
  final String text;
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
            iconData,
            color: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
