import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showErrorAlertDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Error'),
      content: Text(errorMessage),
      actions: [
        ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('OK'))
      ],
    ),
  );
}
