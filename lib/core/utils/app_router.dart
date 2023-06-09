import 'package:go_router/go_router.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/features/account_feature.dart/presentation/views/account_body.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/login_view.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/register_view.dart';
import 'package:shopping_time/features/home_view_feature/data/models/category_model.dart';
import 'package:shopping_time/features/cart_feature/presentation/views/cart_view.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/category_products_view.dart';
import 'package:shopping_time/features/favorite_feature/presentation/views/favorites_body.dart';
import 'package:shopping_time/features/home_view_feature/presentation/views/product_details_view.dart';
import '../../features/home_view_feature/presentation/views/home_layout.dart';
import '../../features/on_boarding_feature/presentation/views/on_boading_view.dart';
import '../../features/splash_feature/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/onBoarding';
  static const kLogin = '/login';
  static const kRegister = '/register';
  static const kHomeView = '/homeView';
  static const kAccountView = '/accountView';
  static const kCartView = '/cartView';
  static const kFavoritesView = '/favoritesView';
  static const kCategoryProductsView = '/categoryProductsView';
  static const kProductDetailsView = '/productDetailsView';

  static final goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/onBoarding',
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeLayout(),
      ),
      GoRoute(
        path: '/accountView',
        builder: (context, state) => const AccountBody(),
      ),
      GoRoute(
        path: '/cartView',
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: '/favoritesView',
        builder: (context, state) => const FavoritesBody(),
      ),
      GoRoute(
        path: '/categoryProductsView',
        builder: (context, state) =>
            CategoryProductsView(categoryItem: state.extra as CategoryModel),
      ),
      GoRoute(
        path: '/productDetailsView',
        builder: (context, state) =>
            ProductDetailsView(productModel: state.extra as ProductModel),
      ),
    ],
  );
}
