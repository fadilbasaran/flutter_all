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
  final hintText = 'Password';

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
        icon: AnimatedCrossFade(
            firstChild: Icon(
              Icons.visibility_off_outlined,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            secondChild: Icon(
              Icons.visibility_outlined,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            crossFadeState: _isSecure
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(seconds: 2)));
  }
}
