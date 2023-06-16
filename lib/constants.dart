import 'package:shopping_time/core/models/product_model/product_model.dart';

const appPrimaryColor = 0xffebeaef;

const appSecondaryColor = 0xffFC4F00;

const subtitleColor = 0xffFC2947;

String? currentUserId;

bool? onBoarding;

List<ProductModel> productsList = [];

const String cartMap = 'cartMap';

Map<String, dynamic> cartProductsWithQuantitiesSaved = {};

const String favoritesSet = 'favoritesSet';

Map<String, dynamic> favoritesSaved = {};

const String noProfileImage =
    'https://firebasestorage.googleapis.com/v0/b/shopping-time-cd9cf.appspot.com/o/no_profile.png?alt=media&token=0dd66d16-f9f2-4089-ba4a-a60c176256bf';
