import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import 'dimensions.dart';

// ignore_for_file: avoid_classes_with_only_static_members
///
/// Contains useful functions to reduce boilerplate code
///
class UiHelper {
  //* <--------------------- Notifications State
  static String _notificationMessage = '';
  // Actual device screen size
  static double _screenHeight;
  static double _screenWidth;

  // You should call this after you get the first MaterialApp context
  static void updateScreenDimensions(BuildContext context) {
    _screenWidth = context.width;
    _screenHeight = context.height;
  }

  // Height, Width, Size Functions
  static double height(double height) {
    if (_screenHeight == null) return height;
    return _screenHeight * height / kRefrenceScreenHeight;
  }

  static double width(double width) {
    if (_screenWidth == null) return width;
    return (_screenWidth * width / kRefrenceScreenWidth).ceilToDouble();
  }

  static double size(double size) => width(size);

  /// Returns a vertical space with height set to [_VerticalSpaceXSmall]
  static Widget verticalSpaceXSmall() {
    return SizedBox(
      height: height(kVerticalSpaceXSmall),
    );
  }

  /// Returns a vertical space with height set to [_VerticalSpaceSmall]
  static Widget verticalSpaceSmall() {
    return SizedBox(
      height: height(kVerticalSpaceSmall),
    );
  }

  /// Returns a vertical space with height set to [_VerticalSpaceMedium]
  static Widget verticalSpaceMedium() {
    return SizedBox(
      height: height(kVerticalSpaceMedium),
    );
  }

  /// Returns a vertical space with height set to [_VerticalSpaceLarge]
  static Widget verticalSpaceLarge() {
    return SizedBox(
      height: height(kVerticalSpaceLarge),
    );
  }

  /// Returns a vertical space with height set to [_VerticalSpaceXLarge]
  static Widget verticalSpaceXLarge() {
    return SizedBox(
      height: height(kVerticalSpaceXLarge),
    );
  }

  /// Returns a horizontal space with height set to [_HorizontalSpaceXSmall]
  static Widget horizontalSpaceXSmall() {
    return SizedBox(
      width: width(kHorizontalSpaceXSmall),
    );
  }

  /// Returns a horizontal space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return SizedBox(
      width: width(kHorizontalSpaceSmall),
    );
  }

  /// Returns a horizontal space with height set to [_HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return SizedBox(
      width: width(kHorizontalSpaceMedium),
    );
  }

  /// Returns a horizontal space with height set to [HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return SizedBox(
      width: width(kHorizontalSpaceLarge),
    );
  }

  /// Returns a horizontal space with height set to [HorizontalSpaceXLarge]
  static Widget horizontalSpaceXLarge() {
    return SizedBox(
      width: width(kHorizontalSpaceXLarge),
    );
  }

  /// Custom Margins
  static Widget verticalSpace(double space) => SizedBox(
        height: height(space),
      );

  static Widget horizontalSpace(double space) => SizedBox(
        width: width(space),
      );
  //* <---------------------------------------------------------  Border Radius
  /// Radius Boders

  static BorderRadius radiusBig() {
    return const BorderRadius.all(Radius.circular(kRadius1));
  }

  static BorderRadius radiusMedium() {
    return const BorderRadius.all(Radius.circular(kRadius2));
  }

  static BorderRadius radiusSmall() {
    return const BorderRadius.all(Radius.circular(kRadius2));
  }

  static BorderRadius topRoundedEdgesBig() {
    return const BorderRadius.only(
        topLeft: Radius.circular(kRadius1),
        topRight: Radius.circular(kRadius1));
  }

  static BorderRadius topRoundedEdgesSmall() {
    return const BorderRadius.only(
        topLeft: Radius.circular(kRadius3),
        topRight: Radius.circular(kRadius3));
  }

  static BorderRadius rightRoundedEdgesBig() {
    return const BorderRadius.only(
        bottomRight: Radius.circular(kRadius1),
        topRight: Radius.circular(kRadius1));
  }

  static BorderRadius rightRoundedEdgesSmall() {
    return const BorderRadius.only(
        bottomRight: Radius.circular(kRadius3),
        topRight: Radius.circular(kRadius3));
  }

  static BorderRadius leftRoundedEdgesBig() {
    return const BorderRadius.only(
        bottomLeft: Radius.circular(kRadius1),
        topLeft: Radius.circular(kRadius1));
  }

  static BorderRadius leftRoundedEdgesSmall() {
    return const BorderRadius.only(
        bottomLeft: Radius.circular(kRadius3),
        topLeft: Radius.circular(kRadius3));
  }

  static BorderRadius bottomRoundedEdges({double radius = kRadius1}) {
    return BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius));
  }

  // Custom Methods
  static BorderRadius allRoundedEdges(double radius) {
    return BorderRadius.all(Radius.circular(radius));
  }

  static BorderRadius topRoundedEdges(double radius) {
    return BorderRadius.only(
        topLeft: Radius.circular(radius), topRight: Radius.circular(radius));
  }

  static BorderRadius rightRoundedEdges(double radius) {
    return BorderRadius.only(
        bottomRight: Radius.circular(radius),
        topRight: Radius.circular(radius));
  }

  static BorderRadius leftRoundedEdges(double radius) {
    return BorderRadius.only(
        topLeft: Radius.circular(radius), bottomLeft: Radius.circular(radius));
  }

  //* <------------------------------------------------  Text Fieald Decoration
  /// Outline Border
  static InputBorder get noBorder => const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      );

  //* <------------------------------------------------ Notification & Messages

// Show Notification
  static void showNotification(String message,
      {NotificationPosition position, bool isError = true}) {
    if (_notificationMessage != message) {
      _notificationMessage = message;
      showOverlayNotification(
        (context) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: isError
              ? Theme.of(context).accentColor
              : Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: context.textTheme.button,
            ),
          ),
        ),
        duration: const Duration(seconds: 3),
        position: position,
      ).dismissed.then((value) {
        _notificationMessage = '';
      });
    }
  }

  // Show Alert Dialog
  static void showSimpleAlertDialog(
      {BuildContext context,
      VoidCallback action,
      String message,
      String okButtonText,
      String cancelButtonText}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Text(
          message,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              cancelButtonText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          FlatButton(
            onPressed: action,
            child: Text(okButtonText,
                style: Theme.of(context).textTheme.subtitle2),
          ),
        ],
      ),
    );
  }

  //* <----------------------------------------- Functions & Extensions
  // Post Frame Callbacks
  static void postBuildCallback(void Function(Duration) callback) {
    WidgetsBinding.instance.addPostFrameCallback(callback);
  }

  static void navigatorPostBuildCallback(
      {@required BuildContext context, @required String destination}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, destination);
    });
  }
} // Class UiHelper

/// *** Extensions on BuildContext class *** ----------------------------------
extension SugarExt on BuildContext {
  //* Dimensions Extensions
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double heightR(double value) => MediaQuery.of(this).size.height * value;
  double widthR(double value) => MediaQuery.of(this).size.width * value;

  //* Locale Extensions
  String get langCode => Localizations.localeOf(this).languageCode;
  bool get isAr => Localizations.localeOf(this).languageCode == 'ar';

  //* Theme Extensions
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);

  //* Close Keyboard
  void closeKeyboard() {
    FocusScope.of(this).requestFocus(FocusNode());
  }
}
