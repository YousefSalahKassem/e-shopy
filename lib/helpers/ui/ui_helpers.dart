import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/dimensions.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_boilerplate/helpers/ui/extensions.dart';

// ignore_for_file: avoid_classes_with_only_static_members
///
/// Contains useful functions to reduce boilerplate code
///
class UiHelper {
  //* <--------------------- Notifications State
  static String _notificationMessage = '';

  //* <------------------------------------------------------  Border Radius

  /// Radius Boders
  static BorderRadius allRoundedEdges([double radius = kDefaultRadius]) {
    return BorderRadius.all(Radius.circular(radius));
  }

  //* <------------------------------------------------  Text Fieald Decoration
  /// Outline Border
  static InputBorder get noBorder => const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      );

  //* <------------------------------------------------  Gradient Decoration
  static Gradient scaffoldGradient({required List<Color> colors}) =>
      LinearGradient(
          colors: colors,
          begin: const Alignment(-1.0, -4.0),
          end: const Alignment(1.0, 4.0));

  static Gradient buttonGradient({required List<Color> colors}) =>
      LinearGradient(
          colors: colors,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft);

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


