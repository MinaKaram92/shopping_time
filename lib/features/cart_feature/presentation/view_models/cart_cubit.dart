import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/network/local/cache_helper.dart';
import 'package:shopping_time/features/cart_feature/data/models/cart_model.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_states.dart';

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
    userCart = [];
    try {
      for (var product in productsList) {
        if (cartProductsWithQuantities.containsKey('${product.id}')) {
          userCart.add(CartModel(
              productModel: product,
              quantity: cartProductsWithQuantities['${product.id}']));
        }
      }
      emit(SuccessGetCartState());
    } catch (e) {
      emit(FailureGetCartState(e.toString()));
    }
  }

  void addProductToCart(ProductModel productModel) async {
    try {
      cartProductsWithQuantities.addAll({'${productModel.id}': 1});
      CacheHelper.saveData('cart', jsonEncode(cartProductsWithQuantities));
      getCart();
      print(cartProductsWithQuantities);
      emit(SuccessAddToCartState());
    } catch (e) {
      emit(FailureAddToCartState(e.toString()));
    }
  }

  void removeProductFromCart(ProductModel productModel) {
    // try {
    cartProductsWithQuantities.remove('${productModel.id}');
    CacheHelper.saveData('cart', jsonEncode(cartProductsWithQuantities));
    getCart();
    print(cartProductsWithQuantities);
    emit(SuccessRemoveCartState());
    // } catch (e) {
    //   emit(FailureRemoveCartState(e.toString()));
    // }
  }

  void cartPressed(ProductModel productModel) async {
    if (cartProductsWithQuantities.containsKey('${productModel.id}')) {
      removeProductFromCart(productModel);
    } else {
      addProductToCart(productModel);
    }
  }

  void increaseQuantity(CartModel cartModel) {
    cartProductsWithQuantities['${cartModel.productModel.id}'] =
        cartModel.quantity + 1;
    CacheHelper.saveData('cart', jsonEncode(cartProductsWithQuantities));
    getCart();
    emit(SuccessChangeQuantityCartState());
  }

  void decreaseQuantity(CartModel cartModel) {
    cartProductsWithQuantities['${cartModel.productModel.id}'] =
        cartModel.quantity - 1;
    CacheHelper.saveData('cart', jsonEncode(cartProductsWithQuantities));
    getCart();
    emit(SuccessChangeQuantityCartState());
  }
}
