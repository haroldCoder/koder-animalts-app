import 'package:firebase_auth/firebase_auth.dart';

class GoogleUserService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool isUserLogged() {
    try {
      return _firebaseAuth.currentUser != null;
    } catch (e) {
      return false;
    }
  }
}
