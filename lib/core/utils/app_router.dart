import 'package:go_router/go_router.dart';
import 'package:shopping_time/core/models/product_model/product_model.dart';
import 'package:shopping_time/features/account_feature/presentation/views/account_body.dart';
import 'package:shopping_time/features/account_feature/presentation/views/cards_view.dart';
import 'package:shopping_time/features/account_feature/presentation/views/order_history_view.dart';
import 'package:shopping_time/features/account_feature/presentation/views/profile_view.dart';
import 'package:shopping_time/features/account_feature/presentation/views/shipping_address_view.dart';
import 'package:shopping_time/features/app_Layout_feature/presentation/views/app_layout.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/login_view.dart';
import 'package:shopping_time/features/auth_feature/presentation/views/signup_view.dart';
import 'package:shopping_time/features/home_feature/data/models/category_model.dart';
import 'package:shopping_time/features/cart_feature/presentation/views/cart_view.dart';
import 'package:shopping_time/features/category_products_feature/presentation/views/category_products_view.dart';
import 'package:shopping_time/features/favorite_feature/presentation/views/favorites_body.dart';
import 'package:shopping_time/features/home_feature/presentation/views/product_details_view.dart';
import '../../features/on_boarding_feature/presentation/views/on_boading_view.dart';
import '../../features/splash_feature/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/onBoarding';
  static const kLogin = '/login';
  static const kRegister = '/register';
  static const kAppLayout = '/appLayout';
  static const kAccountView = '/accountView';
  static const kCartView = '/cartView';
  static const kFavoritesView = '/favoritesView';
  static const kCategoryProductsView = '/categoryProductsView';
  static const kProductDetailsView = '/productDetailsView';
  static const kProfileView = '/profileView';
  static const kShippingAddressView = '/shippingAddressView';
  static const kOrderHistoryView = '/orderHistoryView';
  static const kCardsView = '/cardsView';

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
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: '/appLayout',
        builder: (context, state) => const AppLayout(),
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
      GoRoute(
        path: '/profileView',
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: '/shippingAddressView',
        builder: (context, state) => const ShippingAddressView(),
      ),
      GoRoute(
        path: '/orderHistoryView',
        builder: (context, state) => const OrderHistoryView(),
      ),
      GoRoute(
        path: '/cardsView',
        builder: (context, state) => const CardsView(),
      ),
    ],
  );
}
