import 'package:flutter/material.dart';
import 'package:shopping_time/features/home_view_feature/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.categoryItem,
  }) : super(key: key);

  final CategoryModel categoryItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      child: Column(
        children: [
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(categoryItem.image)),
            ),
          ),
          Text(categoryItem.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
