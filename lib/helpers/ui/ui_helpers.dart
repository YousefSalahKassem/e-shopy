import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _verticalSpaceXSmall = 4.0;
  static const double _verticalSpaceSmall = 8.0;
  static const double _verticalSpaceMedium = 12.0;
  static const double _verticalSpaceLarge = 24.0;
  static const double _verticalSpaceXLarge = 32.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double _horizontalSpaceXSmall = 4.0;
  static const double _horizontalSpaceSmall = 8.0;
  static const double _horizontalSpaceMedium = 12.0;
  static const double _horizontalSpaceLarge = 24.0;
  static const double _horizontalSpaceXLarge = 32.0;

  /// Returns a vertical space with height set to [_VerticalSpaceSmall]
  static Widget verticalSpaceSmall() {
    return const SizedBox(
      height: _verticalSpaceSmall,
    );
  }

  /// Returns a vertical space with height set to [_VerticalSpaceXSmall]
  static Widget verticalSpaceXSmall() {
    return const SizedBox(
      height: _verticalSpaceXSmall,
    );
  }

  /// Returns a vertical space with height set to [_VerticalSpaceMedium]
  static Widget verticalSpaceMedium() {
    return const SizedBox(
      height: _verticalSpaceMedium,
    );
  }

  /// Returns a vertical space with height set to [_VerticalSpaceLarge]
  static Widget verticalSpaceLarge() {
    return const SizedBox(
      height: _verticalSpaceLarge,
    );
  }

  /// Returns a vertical space with height set to [_VerticalSpaceXLarge]
  static Widget verticalSpaceXLarge() {
    return const SizedBox(
      height: _verticalSpaceXLarge,
    );
  }

  /// Returns a horizontal space with height set to [_HorizontalSpaceXSmall]
  static Widget horizontalSpaceXSmall() {
    return const SizedBox(
      width: _horizontalSpaceXSmall,
    );
  }

  /// Returns a horizontal space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return const SizedBox(
      width: _horizontalSpaceSmall,
    );
  }

  /// Returns a horizontal space with height set to [_HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return const SizedBox(
      width: _horizontalSpaceMedium,
    );
  }

  /// Returns a horizontal space with height set to [HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return const SizedBox(
      width: _horizontalSpaceLarge,
    );
  }

  /// Returns a horizontal space with height set to [HorizontalSpaceXLarge]
  static Widget horizontalSpaceXLarge() {
    return const SizedBox(
      width: _horizontalSpaceXLarge,
    );
  }

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
}

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
