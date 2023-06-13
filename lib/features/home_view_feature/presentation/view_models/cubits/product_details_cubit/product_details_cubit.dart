import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/widgets/increase_decrease_cart_quantity.dart';
import 'package:shopping_time/features/cart_feature/data/models/cart_model.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/product_details_cubit/product_details_states.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/widgets/product_details_add_to_cart.dart';

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
    return cartProductsWithQuantities.containsKey('${productModel.id}');
  }

  Widget buildProductDetailsCartButton() {
    if (inCart()) {
      return Expanded(
        child: IncreaseDecreaseCartQantity(
          cartModel: CartModel(
              productModel: productModel,
              quantity: cartProductsWithQuantities['${productModel.id}']),
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
