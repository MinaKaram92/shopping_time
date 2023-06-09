import 'package:flutter/material.dart';

class ProductDetailsNumberItem extends StatelessWidget {
  const ProductDetailsNumberItem(
      {Key? key, required this.iconData, required this.text})
      : super(key: key);
  final IconData iconData;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 20.0),
        )
      ],
    );
  }
}
