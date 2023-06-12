import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';

class RateItem extends StatelessWidget {
  const RateItem({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      height: 30.0,
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(16.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${productModel.rating!.rate}'),
          const Icon(
            FontAwesomeIcons.solidStar,
            size: 20.0,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
