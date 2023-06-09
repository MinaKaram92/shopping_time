import 'package:flutter/material.dart';
import 'package:shopping_time/features/on_boarding_feature/data/models/on_boarding_model.dart';
import 'package:shopping_time/features/on_boarding_feature/utils/on_boarding_text_styles.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({Key? key, required this.model}) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 1.3 / 3,
          width: 275,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(model.image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          model.title,
          // todo check the colors
          style: OnBoardingTextStyles.textStyle30,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          model.subTitle,
          style: OnBoardingTextStyles.textStyle22,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
