import 'package:flutter/material.dart';
import 'package:shopping_time/core/constants/constants.dart';
import 'package:shopping_time/core/utils/app_text_styles.dart';

class NoItems extends StatelessWidget {
  const NoItems({Key? key, required this.image, required this.title})
      : super(key: key);
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(appPrimaryColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * 1 / 2,
              height: size.height * 1 / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Text(
                title,
                style: AppTextStyles.textStyle24Bold
                    .copyWith(color: Colors.yellow.shade800),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
