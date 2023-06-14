import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/core/network/local/cache_helper.dart';
import 'package:shopping_time/features/cart_feature/presentation/view_models/cart_cubit.dart';
import 'package:shopping_time/features/favorite_feature/presentation/view_models/favorite_states.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit() : super(InitialFavoriteState());

  List<ProductModel> favorites = [];

  void getFavorites() {
    try {
      favorites = [];
      for (var product in productsList) {
        if (favoritesSaved.containsKey('${product.id}')) {
          favorites.add(product);
        }
      }
      emit(SuccessGetFavoritesState());
    } catch (e) {
      emit(FailureGetFavoritesState(e.toString()));
    }
  }

  Color getFavIconColor(ProductModel productModel) {
    return favoritesSaved.containsKey('${productModel.id}')
        ? const Color(appSecondaryColor)
        : Colors.grey.shade600;
  }

  void addToFavorites(ProductModel productModel) {
    try {
      favoritesSaved.addAll({'${productModel.id}': true});
      CacheHelper.saveData(favoritesSet, jsonEncode(favoritesSaved));
      getFavorites();
      emit(SuccessAddProductToFavoritesState());
    } catch (e) {
      emit(FailureAddProductToFavoritesState(e.toString()));
    }
  }

  void removeProductFromFavorites(ProductModel productModel) {
    try {
      favoritesSaved.remove('${productModel.id}');
      CacheHelper.saveData(favoritesSet, jsonEncode(favoritesSaved));
      getFavorites();
      emit(SuccessRemoveProductFromFavoritesState());
    } catch (e) {
      emit(FailureRemoveProductFromFavoritesState(e.toString()));
    }
  }

  void favPressed(BuildContext context, ProductModel productModel) {
    if (favoritesSaved.containsKey('${productModel.id}')) {
      removeProductFromFavorites(productModel);
    } else {
      if (cartProductsWithQuantitiesSaved.containsKey('${productModel.id}')) {
        showDialog(
            context: context,
            builder: (context) {
              return showAlertDialog(
                context,
                content:
                    'Item already in cart, do you want to move it to favorites?',
                okPressed: () {
                  BlocProvider.of<CartCubit>(context)
                      .removeProductFromCart(productModel);
                  addToFavorites(productModel);
                  Navigator.of(context).pop();
                },
              );
            });
      } else {
        addToFavorites(productModel);
      }
    }
  }
}
