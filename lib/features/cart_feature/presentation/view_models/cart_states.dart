abstract class CartStates {}

class InitialCartState extends CartStates {}

class LoadingCartState extends CartStates {}

class SuccessAddToCartState extends CartStates {}

class FailureAddToCartState extends CartStates {
  final String errorMessage;

  FailureAddToCartState(this.errorMessage);
}

class SuccessGetCartState extends CartStates {}

class FailureGetCartState extends CartStates {
  final String errorMessage;

  FailureGetCartState(this.errorMessage);
}

class SuccessRemoveCartState extends CartStates {}

class FailureRemoveCartState extends CartStates {
  final String errorMessage;

  FailureRemoveCartState(this.errorMessage);
}

class SuccessChangeQuantityCartState extends CartStates {}

class FailureChangeQuantityCartState extends CartStates {
  final String errorMessage;

  FailureChangeQuantityCartState(this.errorMessage);
}
