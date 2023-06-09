import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_methods/auth_method.dart';

class FacebookAuthMethod implements AuthMethod {
  Future<void> loginWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Future<void> authUser() async {
    await loginWithFacebook();
  }
}
