import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
  final instance = FirebaseAuth.instance;

  Future<UserCredential> signUpEmaiLPass(String email, String pass) async {
    return await instance.createUserWithEmailAndPassword(
        email: email, password: pass);
  }

  Future<UserCredential> signInEmaiLPass(String email, String pass) async {
    return await instance.signInWithEmailAndPassword(
        email: email, password: pass);
  }

  Future signOut() async {
    await instance.signOut();
  }
}
