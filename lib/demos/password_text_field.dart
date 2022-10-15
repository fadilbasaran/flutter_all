import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isSecure = true;
  final obscurText = '*';
  final hintText = 'Pfinalrd';

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: const [AutofillHints.password],
      obscureText: _isSecure,
      obscuringCharacter: obscurText,
      decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          hintText: hintText,
          suffix: _onVisibilityIcon()),
      keyboardType: TextInputType.visiblePassword,
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
        onPressed: () {
          _changeLoading();
        },
        icon: Icon(_isSecure ? Icons.visibility_off : Icons.visibility));
  }
}
