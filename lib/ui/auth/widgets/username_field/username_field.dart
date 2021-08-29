import 'package:flutter/material.dart';
import 'package:bluestacks/constants/error_messages.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController usernameController;
  UsernameField(this.usernameController);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _buildUsernameField(),
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      controller: usernameController,
      validator: _usernameValidator,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          labelText: 'Phone',
          filled: true,
      ),
    );
  }

  String _usernameValidator(String value) {

    value = value.trim();

    if (value.isEmpty)
     return ErrorMessages.FIELD_EMPTY_ERROR;

    if (value.length < 3 || value.length > 11) {
      return ErrorMessages.FIELD_INVALID_ERROR;
    }

    return null;
  }

}