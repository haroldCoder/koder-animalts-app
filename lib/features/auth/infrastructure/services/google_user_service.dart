import 'package:google_sign_in/google_sign_in.dart';

class GoogleUserService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<GoogleSignInAccount?> signInSilently() async {
    try {
      return await _googleSignIn.attemptLightweightAuthentication();
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }
}
