abstract class AccountStates {}

class InitialAccountState extends AccountStates {}

class LoadingGetUserAccountState extends AccountStates {}

class SuccessGetUserDataState extends AccountStates {}

class FailureGetUserDataState extends AccountStates {
  final String errMessage;

  FailureGetUserDataState(this.errMessage);
}

class SuccessPickImageState extends AccountStates {}

class FailurePickImageState extends AccountStates {
  final String errMessage;

  FailurePickImageState(this.errMessage);
}

class SuccessUploadProfileImageState extends AccountStates {}

class FailureUploadProfileImageState extends AccountStates {
  final String errMessage;

  FailureUploadProfileImageState(this.errMessage);
}

class SuccessUpdateUserDataState extends AccountStates {}

class FailureUpdateUserDataState extends AccountStates {
  final String errMessage;

  FailureUpdateUserDataState(this.errMessage);
}

class SuccessUpdateEmailState extends AccountStates {}

class FailureUpdateEmailState extends AccountStates {
  final String errMessage;

  FailureUpdateEmailState(this.errMessage);
}

class SuccessSignOutState extends AccountStates {}

class FailureSignOutState extends AccountStates {
  final String errMessage;

  FailureSignOutState(this.errMessage);
}
