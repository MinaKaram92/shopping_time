import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/features/cart_feature/data/models/cart_model.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(InitialCartState());

  var cartCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('cart');

  Future<void> addProductToCart(CartModel cartModel) async {
    try {
      await cartCollection.add(cartModel.toJson());
      getUserCart();
      emit(SuccessAddToCartState());
    } on FirebaseException catch (e) {
      emit(FailureAddToCartState(e.code));
    } catch (e) {
      emit(FailureAddToCartState(e.toString()));
    }
  }

  List<CartModel> userCart = [];

  bool inCart = false;

  void isInCart(ProductModel productModel) {
    for (var cartModel in userCart) {
      if (cartModel.productModel.id == productModel.id) {
        inCart = true;
        emit(ChangeIsInCartState());
      }
    }
  }

  Future<void> getUserCart() async {
    userCart = [];
    try {
      var carts = await cartCollection.get();
      for (var cart in carts.docs) {
        CartModel cartModel = CartModel.fromJson(cart.data());
        userCart.add(cartModel);
      }
    } on FirebaseException catch (e) {
      emit(FailureAddToCartState(e.code));
    } catch (e) {
      emit(FailureAddToCartState(e.toString()));
    }
  }

  removeProductFromCart(ProductModel productModel) async {
    var carts = await cartCollection.get();
    carts.docs.map((element) {
      if (element.data()['productModel']['id'] == productModel.id) {
        return carts.docs.remove(element);
      }
    });
  }
}
