import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

// ignore_for_file: avoid_classes_with_only_static_members
///
/// Contains useful functions to reduce boilerplate code
///
class UiHelper {
  //* <--------------------- Vertical spacing constants. Adjust to your liking.
  static const double _verticalSpaceXSmall = 4.0;
  static const double _verticalSpaceSmall = 8.0;
  static const double _verticalSpaceMedium = 12.0;
  static const double _verticalSpaceLarge = 24.0;
  static const double _verticalSpaceXLarge = 32.0;

  //* <------------------  Horizontal spacing constants. Adjust to your liking.
  static const double _horizontalSpaceXSmall = 4.0;
  static const double _horizontalSpaceSmall = 8.0;
  static const double _horizontalSpaceMedium = 12.0;
  static const double _horizontalSpaceLarge = 24.0;
  static const double _horizontalSpaceXLarge = 32.0;

  //* <------------------ This is the screen size you develop / design on (i.e : emulator)
  static const double _refrenceScreenHeight = 683.4285714285714;
  static const double _refrenceScreenWidth = 411.42857142857144;

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
    return _screenHeight * height / _refrenceScreenHeight;
  }

  static double width(double width) {
    if (_screenWidth == null) return width;
    return (_screenWidth * width / _refrenceScreenWidth).ceilToDouble();
  }

  static double size(double size) => width(size);

  /// Returns a vertical space with height set to [_VerticalSpaceXSmall]
  static Widget verticalSpaceXSmall() {
    return SizedBox(
      height: height(_verticalSpaceXSmall),
    );
  }

  /// Returns a vertical space with height set to [_VerticalSpaceSmall]
  static Widget verticalSpaceSmall() {
    return SizedBox(
      height: height(_verticalSpaceSmall),
    );
  }

  /// Returns a vertical space with height set to [_VerticalSpaceMedium]
  static Widget verticalSpaceMedium() {
    return SizedBox(
      height: height(_verticalSpaceMedium),
    );
  }

  /// Returns a vertical space with height set to [_VerticalSpaceLarge]
  static Widget verticalSpaceLarge() {
    return SizedBox(
      height: height(_verticalSpaceLarge),
    );
  }

  /// Returns a vertical space with height set to [_VerticalSpaceXLarge]
  static Widget verticalSpaceXLarge() {
    return SizedBox(
      height: height(_verticalSpaceXLarge),
    );
  }

  /// Returns a horizontal space with height set to [_HorizontalSpaceXSmall]
  static Widget horizontalSpaceXSmall() {
    return SizedBox(
      width: width(_horizontalSpaceXSmall),
    );
  }

  /// Returns a horizontal space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return SizedBox(
      width: width(_horizontalSpaceSmall),
    );
  }

  /// Returns a horizontal space with height set to [_HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return SizedBox(
      width: width(_horizontalSpaceMedium),
    );
  }

  /// Returns a horizontal space with height set to [HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return SizedBox(
      width: width(_horizontalSpaceLarge),
    );
  }

  /// Returns a horizontal space with height set to [HorizontalSpaceXLarge]
  static Widget horizontalSpaceXLarge() {
    return SizedBox(
      width: width(_horizontalSpaceXLarge),
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

  static BorderRadius bottomRoundedEdges(double radius) {
    return BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius));
  }

  //* <------------------------------------------------  Text Fieald Decoration
  /// Outline Border
  static InputBorder get noBorder => const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      );

  //* <------------------------------------------------ Notification & Messages

  // Show Notifications
  static void showNotification(String message,
      {NotificationPosition position}) {
    showOverlayNotification(
      (context) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Text(
            message,
            style: context.textTheme.button,
          ),
        ),
      ),
      duration: const Duration(seconds: 3),
      position: position,
    );
  }

  // Show Alert Dialog
  static void showSimpleAlertDialog(
      {BuildContext context,
      VoidCallback action,
      String message,
      String okButtonText,
      String calncelButtonText}) {
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
              calncelButtonText,
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
}
