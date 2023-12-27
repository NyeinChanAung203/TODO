import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/src/common/show_alert_dialog.dart';

extension AsyncValuAlert on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      final message = _errorMessage(error);
      showErrorAlertDialog(context, message);
    }
  }

  String _errorMessage(Object? error) {
    if (error is FirebaseException) {
      return error.message ?? error.toString();
    } else {
      return error.toString();
    }
  }
}
