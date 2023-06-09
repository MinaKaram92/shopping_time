import 'package:shopping_time/features/on_boarding_feature/data/models/on_boarding_model.dart';

abstract class OnBoardingData {
  static final List<OnBoardingModel> onBoardingModels = [
    const OnBoardingModel(
        image: 'assets/images/1.jpg',
        title: 'Purchace Online',
        subTitle: 'You can buy whatever you need online easliy'),
    const OnBoardingModel(
        image: 'assets/images/2.png',
        title: 'Track Order',
        subTitle: 'Track your order untill you get it so easliy'),
    const OnBoardingModel(
        image: 'assets/images/3.png',
        title: 'Get your order',
        subTitle: 'Finally you get your order, and now enjoy it'),
  ];
}
