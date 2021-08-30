import 'package:flutter/material.dart';

import '../../utils/error_messages.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;

  PasswordField(this.passwordController);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _buildPasswordField(),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: widget.passwordController,
      validator: _passwordValidator,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: _buildTogglePasswordVisibilityButton(),
      ),
    );
  }

  Widget _buildTogglePasswordVisibilityButton() {
    return IconButton(
      icon: Icon(
        _passwordVisible ? Icons.visibility : Icons.visibility_off,
      ),
      onPressed: _togglePasswordVisibility,
    );
  }

  _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  String _passwordValidator(String value) {
    value = value.trim();

    if (value.isEmpty) return ErrorMessages.FIELD_EMPTY_ERROR;

    if (value.length < 3 || value.length > 11) {
      return ErrorMessages.FIELD_INVALID_ERROR;
    }

    return null;
  }
}
