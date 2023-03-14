import 'package:flutter/material.dart';

class UiHelper {
  UiHelper._();

  static void showAlert(
    BuildContext context, {
    required String message,
    bool isError = true,
  }) {
    // todo: colorScheme success
    final color = isError ? Theme.of(context).colorScheme.error : Colors.green;
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(4.0),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
