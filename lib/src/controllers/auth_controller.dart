import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quotes_app/services/firebase_services/cloud_firestore.dart';
import 'package:quotes_app/services/firebase_services/firebase_auth.dart';
import 'package:quotes_app/src/pages/auth_page.dart/auth_page.dart';

import 'package:quotes_app/src/pages/main_page.dart/main_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  final auth = FireAuth();
  final firestore = CloudFirestore();

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.instance.currentUser);
    _user.bindStream(auth.instance.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const AuthPage());
    } else {
      Get.offAll(() => MainPage());
    }
  }

  void signUpEmailPassUsername(String email, pass, username) async {
    try {
      var result = await auth.signUpEmaiLPass(email, pass);
      if (result.user != null) {
        await firestore.createUser(result.user!.uid, username);
      }
    } catch (e) {
      print("error");
    }
  }

  void signInEmailPass(String email, pass) async {
    try {
      await auth.signInEmaiLPass(email, pass);
    } catch (e) {
      print("error");
    }
  }

  void signOut() async {
    await auth.signOut();
  }

  Future<String> getUsername() async {
    return firestore.getUsername(_user.value!.uid);
  }

  String getUID() {
    return _user.value!.uid;
  }

  String? getEmail() {
    return _user.value!.email;
  }
}
