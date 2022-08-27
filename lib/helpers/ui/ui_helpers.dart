import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/flavor/light/colors.dart';
import 'package:flutter_boilerplate/ui/widgets/default_button.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';
import 'package:overlay_support/overlay_support.dart';

// ignore_for_file: avoid_classes_with_only_static_members
///
/// Contains useful functions to reduce boilerplate code in ui
///
class UiHelpers {
  UiHelpers._();

  //* <--------------------- Notifications State
  static String _notificationMessage = '';

//* <------------------------------------------------ Notification & Messages

// Show Notification
  static void showNotification(
    String message, {
    NotificationPosition position = NotificationPosition.bottom,
    int durationInSeconds = 3,
    bool isError = true,
  }) {
    if (_notificationMessage != message) {
      _notificationMessage = message;
      showOverlayNotification(
        (context) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: isError
              ? Theme.of(context).errorColor
              : kPrimaryColor,
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
  static void showSimpleAlertDialog({
    required BuildContext context,
    required VoidCallback action,
    required String message,
    required String okButtonText,
    required String cancelButtonText,
  }) {
    showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      transitionBuilder: (context, animation1, animation2, widget) =>
          Transform.scale(
        scale: animation1.value,
        child: AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: Text(
            message,
            style: Theme.of(context).textTheme.headline5,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                cancelButtonText,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            TextButton(
              onPressed: action,
              child: Text(
                okButtonText,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
      pageBuilder: (context, animation1, animation2) => const SizedBox(),
    );
  }

  // Show Menu Choices
  static void showMenuChoices({
    required BuildContext context,
    required String firstTitle,
    required String secondTitle,
    required VoidCallback firstChoice,
    required VoidCallback secondChoice,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      builder: (context) => AnimatedContainer(
        color: Theme.of(context).cardColor,
        margin: const EdgeInsets.all(10),
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: context.heightR(.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: DefaultButton(text: firstTitle, press: firstChoice),),
            const SizedBox(width: 20),
            Expanded(child: DefaultButton(text: secondTitle, press: secondChoice),)
          ],
        ),
      ),
    );
  }

  //* <------------------------------------------ Post Frame Callback
  static void postBuildCallback(void Function(Duration) callback) {
    WidgetsBinding.instance.addPostFrameCallback(callback);
  }
}
