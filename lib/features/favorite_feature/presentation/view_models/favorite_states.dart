abstract class FavoriteStates {}

class InitialFavoriteState extends FavoriteStates {}

class SuccessGetFavoritesState extends FavoriteStates {}

class FailureGetFavoritesState extends FavoriteStates {
  final String errMessage;

  FailureGetFavoritesState(this.errMessage);
}

class SuccessAddProductToFavoritesState extends FavoriteStates {}

class FailureAddProductToFavoritesState extends FavoriteStates {
  final String errMessage;

  FailureAddProductToFavoritesState(this.errMessage);
}

class SuccessRemoveProductFromFavoritesState extends FavoriteStates {}

class FailureRemoveProductFromFavoritesState extends FavoriteStates {
  final String errMessage;

  FailureRemoveProductFromFavoritesState(this.errMessage);
}
