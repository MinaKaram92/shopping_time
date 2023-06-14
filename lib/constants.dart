import 'package:shopping_time/core/models/product_model/product_model.dart';

const appPrimaryColor = 0xffebeaef;

const appSecondaryColor = 0xffFC4F00;

const subtitleColor = 0xffFC2947;

String? userId;

bool? onBoarding;

List<ProductModel> productsList = [];

const String cartMap = 'cartMap';

Map<String, dynamic> cartProductsWithQuantitiesSaved = {};

const String favoritesSet = 'favoritesSet';

Map<String, dynamic> favoritesSaved = {};
