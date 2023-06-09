abstract class ProductDetailsStates {}

class InitialProductDetailsState extends ProductDetailsStates {}

class ReadMoreProductDetailsState extends ProductDetailsStates {}

class SuccessProductDetailsState extends ProductDetailsStates {}

class FailureProductDetailsState extends ProductDetailsStates {
  final String errorMessage;

  FailureProductDetailsState(this.errorMessage);
}
