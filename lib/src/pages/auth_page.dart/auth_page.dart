import 'package:flutter/material.dart';

import 'package:quotes_app/src/pages/auth_page.dart/widgets/sign_in_form.dart';
import 'package:quotes_app/src/pages/auth_page.dart/widgets/sign_up_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Image.asset(
                  isSignIn
                      ? 'quotes_backgrounds/quote-5.png'
                      : 'quotes_backgrounds/quote-4.png',
                  height: MediaQuery.of(context).size.height / 1.5,
                  // width: MediaQuery.of(context).size.width / 1.3,
                ),
                if (!isSignIn)
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          text: "Hi there!\n",
                          style: Theme.of(context).textTheme.headline3,
                          children: [
                            TextSpan(
                              text: 'Join us now, to:\n',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            TextSpan(
                              text:
                                  '- Share your mindfull quotes with the world!\n',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            TextSpan(
                              text:
                                  "- Find inspirations in other's people quotes!\n",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ]),
                    ),
                  ),
              ],
            ), // Quotes-Background-PNG.png
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isSignIn ? SignInPage() : SignUpPage(),
                    TextButton(
                      onPressed: () {
                        setState(
                          () {
                            isSignIn = !isSignIn;
                          },
                        );
                      },
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) =>
                            const LinearGradient(colors: [
                          Color(0xff33ccff),
                          Color(0xffff99cc),
                        ]).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                        child: Text(isSignIn ? "Join now!" : "Sign In now!",
                            style: Theme.of(context).textTheme.headline3),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
