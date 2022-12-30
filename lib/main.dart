import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:quotes_app/src/pages/auth_page.dart/auth_page.dart';
import 'package:quotes_app/src/pages/main_page.dart/main_page.dart';
import 'package:quotes_app/src/shared/themes/dark_theme.dart';
import 'src/shared/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    name: "dev project",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      initialRoute: "/auth_page",
      routes: {
        "/main_page": (context) => const MainPage(),
        '/auth_page': (context) => const AuthPage()
      },
      theme: darkTheme,
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
    ),
  );
}
