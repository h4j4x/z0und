import 'package:flutter/material.dart';

import '../theme.dart';

class UiHelper {
  UiHelper._();

  static void showAlert(
    BuildContext context, {
    required String message,
    bool isError = true,
  }) {
    final color = isError
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.success;
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
