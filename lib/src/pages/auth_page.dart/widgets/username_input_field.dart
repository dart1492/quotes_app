import 'package:flutter/material.dart';

class UsernameInputField extends StatefulWidget {
  const UsernameInputField({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  @override
  State<UsernameInputField> createState() => _UsernameInputFieldState();
}

class _UsernameInputFieldState extends State<UsernameInputField> {
  String? _validateUsername(String? val) {
    if (val == null || val.isEmpty) {
      return "Empty username";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // cursorColor: Theme.of(context).primaryColorLight,
      controller: widget.controller,
      validator: _validateUsername,
      decoration: const InputDecoration(
        hintText: ' Username',
      ),
      style: Theme.of(context).textTheme.headline4,
      cursorColor: Theme.of(context).dividerColor,
      cursorHeight: 30,
    );
  }
}
