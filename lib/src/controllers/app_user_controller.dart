import 'package:get/get.dart';
import 'package:quotes_app/models/app_user.dart';
import 'package:quotes_app/services/firebase_services/cloud_firestore.dart';
import 'package:quotes_app/src/controllers/auth_controller.dart';

class AppUserController extends GetxController {
  final _firestore = CloudFirestore();
  late Rx<AppUser> _user;

  @override
  void onReady() async {
    print("asd");
    super.onReady();
    _user = Rx<AppUser>(
      AppUser(
          uid: AuthController.instance.getUID(),
          email: AuthController.instance.getEmail()),
    );
    await loadFirestoreData();
    print(_user.value.username);
  }

  Future loadFirestoreData() async {
    List<dynamic>? list = await _firestore.getLikedIDs(_user.value.uid!);
    String username = await _firestore.getUsername(_user.value.uid!);
    _user.value.username = username;
    _user.value.likedIDs = list.cast<String>();
  }

  String getUsername() {
    return _user.value.username!;
  }
}
