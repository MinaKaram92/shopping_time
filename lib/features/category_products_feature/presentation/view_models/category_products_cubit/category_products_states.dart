abstract class CategoryProductsStates {}

class InitialCategoryProductsState extends CategoryProductsStates {}

class LoadingCategoryProductsState extends CategoryProductsStates {}

class SuccessCategoryProductsState extends CategoryProductsStates {}

class FailureCategoryProductsState extends CategoryProductsStates {
  final String errorMessage;

  FailureCategoryProductsState(this.errorMessage);
}
