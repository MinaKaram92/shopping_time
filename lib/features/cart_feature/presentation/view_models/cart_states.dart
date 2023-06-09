abstract class CartStates {}

class InitialCartState extends CartStates {}

class ChangeIsInCartState extends CartStates {}

class SuccessAddToCartState extends CartStates {}

class FailureAddToCartState extends CartStates {
  final String errorMessage;

  FailureAddToCartState(this.errorMessage);
}
