import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/network/local/cache_helper.dart';
import 'package:shopping_time/core/utils/app_router.dart';
import 'package:shopping_time/core/utils/service_locator.dart';
import 'package:shopping_time/features/account_feature/presentation/view_models/account_cubit.dart';
import 'package:shopping_time/features/app_Layout_feature/presentation/view_models/home_layout_cubit/app_layout_cubit.dart';
import 'package:shopping_time/features/favorite_feature/presentation/view_models/favorite_cubit.dart';
import 'package:shopping_time/simple_bloc_observer.dart';
import 'features/cart_feature/presentation/view_models/cart_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ServiceLocator.setup();
  await CacheHelper.init();
  currentUserId = CacheHelper.getData('userId');
  print('main: $currentUserId');
  onBoarding = CacheHelper.getData('onBoardingValue');

  dynamic cartdata = CacheHelper.getData(cartMap);
  cartProductsWithQuantitiesSaved = decodeData(cartdata);

  dynamic favoritesData = CacheHelper.getData(favoritesSet);
  favoritesSaved = decodeData(favoritesData);

  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

Map<String, dynamic> decodeData(dynamic data) {
  if (data != null) {
    return jsonDecode(data);
  }
  return {};
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppLayoutCubit>(
          create: (BuildContext context) => AppLayoutCubit(),
        ),
        BlocProvider<AccountCubit>(
          create: (BuildContext context) => AccountCubit()..getUserData(),
        ),
        BlocProvider<CartCubit>(
          create: (BuildContext context) => CartCubit()..getCart(),
        ),
        BlocProvider<FavoriteCubit>(
          create: (BuildContext context) => FavoriteCubit()..getFavorites(),
        ),
      ],
      child: MaterialApp.router(
        routeInformationParser: AppRouter.goRouter.routeInformationParser,
        routerDelegate: AppRouter.goRouter.routerDelegate,
        routeInformationProvider: AppRouter.goRouter.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
      ),
    );
  }
}
