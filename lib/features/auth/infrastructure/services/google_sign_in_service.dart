import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<GoogleSignInAccount?> signIn() async {
    try {
      await _googleSignIn.initialize(
        serverClientId: dotenv.env['GOOGLE_CLIENT_ID'],
      );

      await _googleSignIn.disconnect();

      final account = await _googleSignIn.authenticate();
      return account;
    } catch (_) {
      return null;
    }
  }

  Future<void> signOut() => _googleSignIn.signOut();
}
