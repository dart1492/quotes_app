import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:quotes_app/src/controllers/app_user_controller.dart';
import 'package:quotes_app/src/controllers/auth_controller.dart';
import 'package:quotes_app/src/pages/auth_page.dart/auth_page.dart';
import 'package:quotes_app/src/shared/themes/dark_theme.dart';
import 'src/shared/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    name: "auth feature app branch",
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    return Get.put(
      AuthController(),
    );
  }).then((value) => Get.put(AppUserController()));

  runApp(
    GetMaterialApp(
      home: const AuthPage(),
      // initialRoute: "/auth_page",
      // routes: {
      //   "/main_page": (context) => MainPage(),
      //   '/auth_page': (context) => const AuthPage()
      // },
      theme: darkTheme,
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
    ),
  );
}
