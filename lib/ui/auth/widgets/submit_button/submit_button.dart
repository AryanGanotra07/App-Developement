import 'package:flutter/material.dart';


class SubmitButton extends StatelessWidget {
  final Function onSubmit;
  final bool valid;
  SubmitButton(this.onSubmit, this.valid);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _buildSubmitButton(),
    );
  }

  Widget _buildSubmitButton() {
    return new ElevatedButton(

      child: Text("Login"),
        onPressed: onSubmit
    );
  }

}