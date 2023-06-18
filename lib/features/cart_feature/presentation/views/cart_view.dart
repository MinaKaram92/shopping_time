import 'package:flutter/material.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/features/cart_feature/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(appPrimaryColor),
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(color: Color(appSecondaryColor)),
        ),
        leading: const BackButton(color: Color(appSecondaryColor)),
        backgroundColor: const Color(appPrimaryColor),
        elevation: 0,
      ),
      body: const CartViewBody(),
    );
  }
}
