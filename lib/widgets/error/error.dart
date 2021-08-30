import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth/auth_provider.dart';
import '../../services/utils/exception_handler.dart';

class Error extends StatefulWidget {
  final Function onRetry;
  final Exception errorException;
  final bool showRetryButton;
  final double height;

  Error(
      {this.errorException,
      this.onRetry,
      this.showRetryButton = true,
      this.height = 200});

  @override
  _ErrorState createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  @override
  void initState() {
    super.initState();
    _logoutIfUnauthorized();
  }

  void _logoutIfUnauthorized() {
    if (widget.errorException is UnauthorisedException) {
      Provider.of<AuthProvider>(context, listen: false).logoutUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _errorHandleWidget();
  }

  Widget _errorHandleWidget() {
    return Container(
      height: widget.height,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.errorException.toString()),
              ),
              widget.showRetryButton
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: widget.onRetry,
                          child: const Text("Retry")),
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
