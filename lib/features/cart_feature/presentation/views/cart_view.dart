import 'package:flutter/material.dart';
import 'package:shopping_time/constants.dart';
import 'package:shopping_time/core/functions.dart';
import 'package:shopping_time/features/cart_feature/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(appPrimaryColor),
      appBar: AppBar(
        leading: backArrow(context),
        backgroundColor: const Color(appPrimaryColor),
        elevation: 0,
      ),
      body: const CartViewBody(),
    );
  }
}
