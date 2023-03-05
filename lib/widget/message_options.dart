import 'package:flutter/material.dart';

class MessageOptionsWidget extends StatelessWidget {
  final String message;
  final Color? messageColor;
  final List<ListTile> options;

  const MessageOptionsWidget({
    super.key,
    required this.message,
    this.messageColor,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      children: [
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: messageColor,
          ),
          textScaleFactor: 1.6,
        ),
        ...options,
      ],
    );
  }
}
