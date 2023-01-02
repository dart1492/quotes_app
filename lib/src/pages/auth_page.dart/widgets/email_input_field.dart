import 'package:flutter/material.dart';

class EmailInputField extends StatefulWidget {
  const EmailInputField({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  String? _validateEmail(String? val) {
    if (val == null || val.isEmpty) {
      return "Empty email";
    } else {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(val)) {
        return null;
      } else {
        return "Invalid email";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: _validateEmail,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: ' Email',
        errorMaxLines: 1,
      ),
      style: Theme.of(context).textTheme.headline4,
      cursorColor: Theme.of(context).dividerColor,
      cursorHeight: 30,
    );
  }
}
