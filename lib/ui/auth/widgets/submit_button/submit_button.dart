import 'package:flutter/material.dart';


class SubmitButton extends StatelessWidget {
  final Function onSubmit;
  SubmitButton(this.onSubmit);
  @override
  Widget build(BuildContext context) {
    return _buildSubmitButton();
  }

  Widget _buildSubmitButton() {
    return new MaterialButton(
      child: Text("Login"),
        onPressed: onSubmit
    );
  }

}