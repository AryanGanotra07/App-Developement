import 'package:flutter/material.dart';


class Error extends StatelessWidget {
  Function onRetry;
  String errorMessage;
  bool showRetryButton = true;
  double height = 200;
  Error({this.errorMessage, this.onRetry, this.showRetryButton = true, this.height = 200});
  @override
  Widget build(BuildContext context) {
    return _errorHandleWidget();
  }

  Widget _errorHandleWidget() {
    return Container(
          height: height,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(errorMessage),
                  ),
                  showRetryButton?
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: onRetry, child: Text("Retry")),
                  ) : SizedBox(
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