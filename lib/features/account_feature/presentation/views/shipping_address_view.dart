import 'package:flutter/material.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';

class ShippingAddressView extends StatelessWidget {
  const ShippingAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shipping Addresses'),
        backgroundColor: const Color(appSecondaryColor),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(appSecondaryColor),
          child: const Icon(Icons.add)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'There are no addresses',
              style: AppTextStyles.textStyle24Reg,
            ),
          ],
        ),
      ),
    );
  }
}
