import 'package:flutter/material.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';

class AddProductToFavoriteOrCart extends StatelessWidget {
  const AddProductToFavoriteOrCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7 / 5,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 65.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    size: 35.0,
                  )),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 60.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        size: 30.0,
                      ),
                    ),
                    const Text(
                      'ADD TO CART',
                      style: AppTextStyles.textStyle18Bold,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
