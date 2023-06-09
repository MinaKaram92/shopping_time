import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/widgets/increase_decrease_cart_quantity.dart';
import 'package:shopping_time/features/cart_feature/data/models/cart_model.dart';
import 'package:shopping_time/features/home_feature/presentation/view_models/product_details_cubit/product_details_states.dart';
import 'package:shopping_time/features/home_feature/presentation/views/widgets/product_details_add_to_cart.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit({required this.productModel})
      : super(InitialProductDetailsState());
  bool isReadMore = false;

  final ProductModel productModel;

  void readMore() {
    isReadMore = !isReadMore;
    emit(ReadMoreProductDetailsState());
  }

  bool inCart() {
    return cartProductsWithQuantitiesSaved.containsKey('${productModel.id}');
  }

  Widget buildProductDetailsCartButton() {
    if (inCart()) {
      return Expanded(
        child: IncreaseDecreaseCartQantity(
          cartModel: CartModel(
              productModel: productModel,
              quantity: cartProductsWithQuantitiesSaved['${productModel.id}']),
          height: 55.0,
          quantitySize: 18.0,
        ),
      );
    } else {
      return ProductDetailsAddToCart(
        productModel: productModel,
      );
    }
  }
}
