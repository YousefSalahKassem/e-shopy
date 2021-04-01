import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This is the [ErrorHandler] provider
///
/// Its purpose is to provide a way to dispatch / read to errors throught the entire app.
/// it should be used around the [MaterialApp] to listen to error messages as follow:
///```dart
///  ProviderScope(
///         overrides: [],
///           child: ProviderListener<ErrorHandler>(
///               provider: errorHandlerProvider,
///               onChange: (_, value) =>
///                   UiHelper.showNotification(tr(value.errorMessage)),
///               child: App()),
///         ),
///
///     );```
///
// Provider Variables
// =========== *** ===========
final errorHandlerProvider = ChangeNotifierProvider<ErrorHandler>((ref) {
  return ErrorHandler();
});

// =========== *** ===========

/// Error Handler
///
/// it exposes two functions to dispatch both dio errors [DioError] => `dispatchDioError`,
/// and normal error messages [String] => `showErrorMessage`.
/// and a single getter to get the current error message to show in the ui => `errorMessage`.
class ErrorHandler with ChangeNotifier {
//* State
  String _errorMessage = '';

  /// A Getter to read error message from the ui.
  String get errorMessage => _errorMessage;

  /// Dispatches dio errors [DioError] usually from a `DioClient`.
  void dispatchDioError(DioError dioError) {
    final errorMessage = _getDioErrorMessage(dioError);
    showErrorMessage(errorMessage);
  }

  /// Shows an error message from any where in the app.
  void showErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  String _getDioErrorMessage(DioError dioError) {
    String message;
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = 'dio_error.cancel';
        break;
      case DioErrorType.connectTimeout:
        message = "dio_error.timeout";
        break;
      case DioErrorType.other:
        message = "dio_error.default";
        break;
      case DioErrorType.receiveTimeout:
        message = "dio_error.timeout";
        break;
      case DioErrorType.response:
        message = _handleStatusCode(dioError);
        break;
      case DioErrorType.sendTimeout:
        message = "dio_error.timeout";
        break;
      default:
        message = 'dio_error.unknown';
        break;
    }
    return message;
  }

  String _handleStatusCode(DioError error) {
    switch (error.response?.statusCode) {
      case 400:
        return 'dio_error.bad_request';

      case 401:
        return 'dio_error.unauthorized';
      case 403:
        return 'dio_error.forbidden';
      case 404:
        return 'dio_error.not_found';

      case 500:
        return 'dio_error.server_error';
      default:
        return 'dio_error.unknown';
    }
  }
}
