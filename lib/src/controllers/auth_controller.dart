import 'package:get/get.dart';
import 'package:quotes_app/models/app_user.dart';
import 'package:quotes_app/services/firebase_services/cloud_firestore.dart';
import 'package:quotes_app/services/firebase_services/firebase_auth.dart';

class AuthController extends GetxController {
  Rx<AppUser>? currentUser;
  final _authService = FireAuth();
  final _firestoreService = CloudFirestore();

  Future<void> signUp(String email, String pass, String username) async {
    var authenticatedUser = await _authService
        .signUpEmaiLPass(email, pass)
        .then((value) => value.user);
    await _firestoreService.createUser(authenticatedUser!.uid);

    AppUser newUser = AppUser(
        email: email,
        username: username,
        uid: authenticatedUser.uid,
        likedIDs: []);

    currentUser = newUser.obs;
  }
}
