import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  final _focusNode = FocusNode();
  bool _isObscured = false;

  String? _validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return "Empty password";
    }
    if (val.length <= 6) {
      return "Short password";
    }

    return null;
  }

  _toggleObscured() {
    setState(() {
      _isObscured = !_isObscured;
      if (_focusNode.hasPrimaryFocus) return;
      _focusNode.canRequestFocus = false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      focusNode: _focusNode,
      obscureText: _isObscured,
      obscuringCharacter: '*',
      cursorColor: Theme.of(context).dividerColor,
      cursorHeight: 30,
      validator: _validatePassword,
      controller: widget.controller,
      style: Theme.of(context).textTheme.headline4,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        suffixIcon: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: _toggleObscured,
            child: Icon(_isObscured ? Icons.visibility_off : Icons.visibility),
          ),
        ),
        hintText: " Password",
      ),
    );
  }
}
