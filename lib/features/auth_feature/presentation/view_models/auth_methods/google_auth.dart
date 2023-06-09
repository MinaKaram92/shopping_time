import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_time/core/network/local/cache_helper.dart';
import 'package:shopping_time/features/auth_feature/presentation/view_models/auth_methods/auth_method.dart';

class GoogleAuthMethod implements AuthMethod {
  Future<void> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(credential);
    saveUserId(user.user!.uid);
  }

  void saveUserId(String id) {
    CacheHelper.saveData('userId', id);
  }

  @override
  Future<void> authUser() async {
    await loginWithGoogle();
  }
}
