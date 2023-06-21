import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/network/local/cache_helper.dart';
import 'package:shopping_time/features/cart_feature/data/models/cart_model.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_states.dart';
import 'package:shopping_time/features/favorite_feature/presentation/view_models/favorite_cubit.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(InitialCartState());

  List<CartModel> userCart = [];

  bool isQuantityDecreasable(CartModel cartModel) {
    if (cartModel.quantity > 1) {
      return true;
    }
    return false;
  }

  void getCart() {
    emit(LoadingCartState());
    userCart = [];
    try {
      for (var product in productsList) {
        if (cartProductsWithQuantitiesSaved.containsKey('${product.id}')) {
          userCart.add(CartModel(
              productModel: product,
              quantity: cartProductsWithQuantitiesSaved['${product.id}']));
        }
      }
      emit(SuccessGetCartState());
    } catch (e) {
      emit(FailureGetCartState(e.toString()));
    }
  }

  Color getCartIconColor(ProductModel productModel) {
    return cartProductsWithQuantitiesSaved.containsKey('${productModel.id}')
        ? const Color(appSecondaryColor)
        : Colors.grey.shade600;
  }

  void addProductToCart(ProductModel productModel) async {
    try {
      cartProductsWithQuantitiesSaved.addAll({'${productModel.id}': 1});
      CacheHelper.saveData(
          cartMap, jsonEncode(cartProductsWithQuantitiesSaved));
      getCart();
      emit(SuccessAddToCartState());
    } catch (e) {
      emit(FailureAddToCartState(e.toString()));
    }
  }

  void removeProductFromCart(ProductModel productModel) {
    try {
      cartProductsWithQuantitiesSaved.remove('${productModel.id}');
      CacheHelper.saveData(
          cartMap, jsonEncode(cartProductsWithQuantitiesSaved));
      getCart();
      emit(SuccessRemoveCartState());
    } catch (e) {
      emit(FailureRemoveCartState(e.toString()));
    }
  }

  void cartPressed(BuildContext context, ProductModel productModel) async {
    if (cartProductsWithQuantitiesSaved.containsKey('${productModel.id}')) {
      removeProductFromCart(productModel);
    } else {
      if (favoritesSaved.containsKey('${productModel.id}')) {
        showDialog(
            context: context,
            builder: (context) {
              return showAlertDialog(
                context,
                content:
                    'Item already in favorites, do you want to move it to cart?',
                okPressed: () {
                  BlocProvider.of<FavoriteCubit>(context)
                      .removeProductFromFavorites(productModel);
                  addProductToCart(productModel);
                  Navigator.of(context).pop();
                },
              );
            });
      } else {
        addProductToCart(productModel);
      }
    }
  }

  void increaseQuantity(CartModel cartModel) {
    cartProductsWithQuantitiesSaved['${cartModel.productModel.id}'] =
        cartModel.quantity + 1;
    CacheHelper.saveData(cartMap, jsonEncode(cartProductsWithQuantitiesSaved));
    getCart();
    emit(SuccessChangeQuantityCartState());
  }

  void decreaseQuantity(CartModel cartModel) {
    cartProductsWithQuantitiesSaved['${cartModel.productModel.id}'] =
        cartModel.quantity - 1;
    CacheHelper.saveData(cartMap, jsonEncode(cartProductsWithQuantitiesSaved));
    getCart();
    emit(SuccessChangeQuantityCartState());
  }
}
