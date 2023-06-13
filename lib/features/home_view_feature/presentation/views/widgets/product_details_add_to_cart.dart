import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_cubit.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_states.dart';

class ProductDetailsAddToCart extends StatelessWidget {
  const ProductDetailsAddToCart({Key? key, required this.productModel})
      : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        final cubit = BlocProvider.of<CartCubit>(context);
        return Expanded(
          child: GestureDetector(
            onTap: () {
              cubit.cartPressed(productModel);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(16.0),
              ),
              height: 55.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add_shopping_cart,
                    size: 30.0,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    'Add To Cart',
                    style: AppTextStyles.textStyle18Bold,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
