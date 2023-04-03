import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoadingDialog(context,
      {customMessage = "Loading... Please Wait", dismissable = true}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () {
              return dismissable;
            },
            child: Dialog(
              child: Container(
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const CircularProgressIndicator(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      customMessage,
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
