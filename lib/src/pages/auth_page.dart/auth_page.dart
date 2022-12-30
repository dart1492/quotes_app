import 'package:flutter/material.dart';
import 'package:quotes_app/src/shared/widgets/colored_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Join now!",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                width: windowWidth / 6,
                height: windowHeight / 10,
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Email'),
                  style: Theme.of(context).textTheme.headline4,
                  cursorColor: Theme.of(context).primaryColorLight,
                  cursorHeight: 30,
                ),
              ),
              SizedBox(
                width: windowWidth / 6,
                height: windowHeight / 10,
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Password'),
                  style: Theme.of(context).textTheme.headline4,
                  cursorColor: Theme.of(context).primaryColorLight,
                  cursorHeight: 30,
                ),
              ),

              // BounceGradientButton(
              //     childText: "Log in",
              //     onButtonTap: () {
              //       Navigator.pushNamed(context, '/main_page');
              //     }),
              GradientHighlitedButton(
                  childText: "Log in",
                  onButtonTap: () {
                    Navigator.pushNamed(context, '/main_page');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
