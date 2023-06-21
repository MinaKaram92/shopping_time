abstract class AccountStates {}

class InitialAccountState extends AccountStates {}

class LoadingGetUserAccountState extends AccountStates {}

class SuccessGetUserDataState extends AccountStates {}

class FailureGetUserDataState extends AccountStates {
  final String errMessage;

  FailureGetUserDataState(this.errMessage);
}

class LoadingUpdateUserDataState extends AccountStates {}

class SuccessUpdateUserDataState extends AccountStates {}

class FailureUpdateUserDataState extends AccountStates {
  final String errMessage;

  FailureUpdateUserDataState(this.errMessage);
}

class LoadingUpdateEmailState extends AccountStates {}

class SuccessUpdateEmailState extends AccountStates {}

class FailureUpdateEmailState extends AccountStates {
  final String errMessage;

  FailureUpdateEmailState(this.errMessage);
}

class LoadingUpdateProfilePhotoState extends AccountStates {}

class SuccessUpdateProfilePhotoState extends AccountStates {}

class FailureUpdateProfilePhotoState extends AccountStates {
  final String errMessage;

  FailureUpdateProfilePhotoState(this.errMessage);
}
