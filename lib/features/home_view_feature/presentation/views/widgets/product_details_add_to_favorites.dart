import 'package:flutter/material.dart';

class ProductDetailsAddToFavorites extends StatelessWidget {
  const ProductDetailsAddToFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.0,
      height: 55.0,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
            size: 35.0,
          )),
    );
  }
}
