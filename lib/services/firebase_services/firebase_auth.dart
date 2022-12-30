import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
  final _instance = FirebaseAuth.instance;

  Future<UserCredential> signUpEmaiLPass(String email, String pass) async {
    return await _instance.createUserWithEmailAndPassword(
        email: email, password: pass);
  }
}
