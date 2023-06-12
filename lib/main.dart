import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/network/local/cache_helper.dart';
import 'package:shopping_time/core/utils/app_router.dart';
import 'package:shopping_time/core/utils/service_locator.dart';
import 'package:shopping_time/simple_bloc_observer.dart';

import 'features/cart_feature/presentation/view_models/cart_cubit.dart';
import 'features/home_view_feature/presentation/view_models/cubits/home_layout_cubit/home_layout_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ServiceLocator.setup();
  await CacheHelper.init();
  userId = CacheHelper.getData('userId');
  onBoarding = CacheHelper.getData('onBoardingValue');
  cartProductsWithQuantities = jsonDecode(CacheHelper.getData('cart')) ?? {};
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeLayoutCubit>(
          create: (BuildContext context) => HomeLayoutCubit(),
        ),
        BlocProvider<CartCubit>(
          create: (BuildContext context) => CartCubit()..getCart(),
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
