import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopping_time/features/account_feature.dart/presentation/views/account_body.dart';
import 'package:shopping_time/features/home_view_feature/data/models/category_model.dart';
import 'package:shopping_time/features/home_view_feature/presentation/view_models/cubits/home_layout_cubit/home_layout_state.dart';
import 'package:shopping_time/features/favorite_feature/presentation/views/favorites_View.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/home_body.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(InitialHomeState());

  final navBarScreens = [
    const HomeBody(),
    const FavoritesView(),
    const AccountBody(),
  ];

  int initialPage = 0;

  void onNavBarTap(int index) {
    initialPage = index;
    emit(NavBarChangePageHomeState());
  }

  List<GButton> navBarTabs = const [
    GButton(
      icon: Icons.home,
      text: 'Home',
    ),
    GButton(
      icon: Icons.favorite,
      text: 'Favorites',
    ),
    GButton(
      icon: Icons.person,
      text: 'Account',
    ),
  ];

  List<CategoryModel> categories = [
    CategoryModel(
        model: 'men\'s clothing',
        name: 'Men\'s Clothing',
        image: 'assets/images/man.jpg'),
    CategoryModel(
        model: 'women\'s clothing',
        name: 'Women\'s Clothig',
        image: 'assets/images/woman.jpg'),
    CategoryModel(
        model: 'electronics',
        name: 'Electronics',
        image: 'assets/images/tech.jpg'),
    CategoryModel(
        model: 'jewelery',
        name: 'Jewelery',
        image: 'assets/images/diamond.jpg'),
  ];

  final searchController = TextEditingController();
}
