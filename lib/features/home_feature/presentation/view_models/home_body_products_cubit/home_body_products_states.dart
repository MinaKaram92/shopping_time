abstract class HomeBodyProductsStates {}

class InitialHomeBodyProductsState extends HomeBodyProductsStates {}

class LoadingHomeBodyProductsState extends HomeBodyProductsStates {}

class SuccessHomeBodyProductsState extends HomeBodyProductsStates {}

class FailureHomeBodyProductsState extends HomeBodyProductsStates {
  final String errorMessage;
  FailureHomeBodyProductsState(this.errorMessage);
}
