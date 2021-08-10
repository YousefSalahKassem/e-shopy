import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_boilerplate/helpers/ui/extensions.dart';

// ignore_for_file: avoid_classes_with_only_static_members
///
/// Contains useful functions to reduce boilerplate code
///
class UiHelper {
  //* <--------------------- Notifications State
  static String _notificationMessage = '';

//* <------------------------------------------------ Notification & Messages

// Show Notification
  static void showNotification(String message,
      {NotificationPosition position = NotificationPosition.top,
      int durationInSeconds = 3,
      bool isError = true}) {
    if (_notificationMessage != message) {
      _notificationMessage = message;
      showOverlayNotification(
        (context) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: isError
              ? context.theme.colorScheme.secondary
              : context.theme.colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: context.textTheme.button,
            ),
          ),
        ),
        duration: Duration(seconds: durationInSeconds),
        position: position,
      ).dismissed.then((value) {
        _notificationMessage = '';
      });
    }
  }

  // Show Alert Dialog
  static void showSimpleAlertDialog(
      {required BuildContext context,
      required VoidCallback action,
      required String message,
      required String okButtonText,
      required String cancelButtonText}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Text(
          message,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              cancelButtonText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          TextButton(
            onPressed: action,
            child: Text(okButtonText,
                style: Theme.of(context).textTheme.subtitle2),
          ),
        ],
      ),
    );
  }

  //* <------------------------------------------ Post Frame Callback
  static void postBuildCallback(void Function(Duration) callback) {
    WidgetsBinding.instance?.addPostFrameCallback(callback);
  }
} // Class UiHelper


