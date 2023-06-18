abstract class AuthStates {}

class InitialAuthState extends AuthStates {}

class ShowPasswordState extends AuthStates {}

class LoadingLoginEmailAndPasswordState extends AuthStates {}

class SuccessLoginEmailAndPasswordState extends AuthStates {}

class FailureLoginEmailAndPasswordState extends AuthStates {
  final String errorMessage;
  FailureLoginEmailAndPasswordState(this.errorMessage);
}

class LoadingSignUpEmailAndPasswordState extends AuthStates {}

class SuccessSignUpWithEmailAndPasswordState extends AuthStates {}

class FailureSignUpWithEmailAndPasswordState extends AuthStates {
  final String errorMessage;
  FailureSignUpWithEmailAndPasswordState(this.errorMessage);
}

class LoadingGoogleAuthState extends AuthStates {}

class SuccessGoogleAuthState extends AuthStates {}

class FailureGoogleAuthState extends AuthStates {
  final String errorMessage;
  FailureGoogleAuthState(this.errorMessage);
}

class LoadingFacebookAuthState extends AuthStates {}

class SuccessFacebookAuthState extends AuthStates {}

class FailureFacebookAuthState extends AuthStates {
  final String errorMessage;
  FailureFacebookAuthState(this.errorMessage);
}

class SuccessSignOutUserState extends AuthStates {}

class FailureSignOutUserState extends AuthStates {
  final String errorMessage;
  FailureSignOutUserState(this.errorMessage);
}
