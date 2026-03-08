import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signIn() async {
    try {
      // En Android, NO se debe pasar clientId; solo serverClientId (ID Web)
      await GoogleSignIn.instance.initialize(
        serverClientId: dotenv.env['GOOGLE_CLIENT_ID'],
      );

      // Iniciar el flujo de autenticación de Google
      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();

      if (googleUser == null) {
        // El usuario canceló o hubo un error
        return null;
      }

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);

      return userCredential;
    } catch (e) {
      print('Error in GoogleSignInService.signIn: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
      await _firebaseAuth.signOut();
    } catch (e) {
      print('Error in GoogleSignInService.signOut: $e');
    }
  }
}
