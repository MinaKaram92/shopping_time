abstract class AuthStates {}

class InitialAuthState extends AuthStates {}

class ShowPasswordState extends AuthStates {}

class SuccessAuthState extends AuthStates {}

class FailureAuthState extends AuthStates {
  final String errorMessage;
  FailureAuthState(this.errorMessage);
}
