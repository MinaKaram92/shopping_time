abstract class CategoryProductsStates {}

class InitialCategoryProductsState extends CategoryProductsStates {}

class SuccessCategoryProductsState extends CategoryProductsStates {}

class FailureCategoryProductsState extends CategoryProductsStates {
  final String errorMessage;

  FailureCategoryProductsState(this.errorMessage);
}
