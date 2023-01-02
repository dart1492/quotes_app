import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/src/controllers/auth_controller.dart';
import 'package:quotes_app/src/pages/auth_page.dart/widgets/email_input_field.dart';

import 'package:quotes_app/src/shared/widgets/colored_button.dart';
import 'package:quotes_app/src/pages/auth_page.dart/widgets/password_input_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final AuthController controller = Get.put(AuthController());
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome back!",
            style: Theme.of(context).textTheme.headline2,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, windowHeight / 20),
            width: windowWidth / 6,
            // height: windowHeight / 10,
            child: EmailInputField(controller: emailController),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, windowHeight / 20),
            width: windowWidth / 6,
            // height: windowHeight / 10,
            child: PasswordInputField(
              controller: passController,
            ),
          ),

          // BounceGradientButton(
          //     childText: "Log in",
          //     onButtonTap: () {
          //       Navigator.pushNamed(context, '/main_page');
          //     }),
          GradientHighlitedButton(
            childText: "Sign In",
            onButtonTap: () async {
              if (formKey.currentState!.validate()) {
                AuthController.instance
                    .signInEmailPass(emailController.text, passController.text);
                print("valid");
              } else {
                print("invalid");
              }

              print(emailController.text);
              print(passController.text);
              print(usernameController.text);
              // Navigator.pushNamed(context, '/main_page');
            },
          ),
          Text("Or", style: Theme.of(context).textTheme.headline4),
        ],
      ),
    );
  }
}
