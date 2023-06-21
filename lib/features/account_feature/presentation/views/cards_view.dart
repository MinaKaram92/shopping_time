import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';

class CardsView extends StatelessWidget {
  const CardsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
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
              'There are no cards yet',
              style: AppTextStyles.textStyle24Reg,
            ),
          ],
        ),
      ),
    );
  }
}
