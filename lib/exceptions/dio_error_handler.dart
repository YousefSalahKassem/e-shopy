import 'dart:async';
import 'package:dio/dio.dart';

class DioErrorHandler {
  // Controllers
  final _errorsMessagesController = StreamController<String>.broadcast();
  final _errorsController = StreamController<DioError>();

  Stream<String> get errorMessagesStream => _errorsMessagesController.stream;
  Function(DioError) get dispatchDioError => _errorsController.sink.add;

// Constructor
  DioErrorHandler() {
    _errorsController.stream.listen((DioError error) {
      final errorMessage = _getDioErrorMessage(error);
      _errorsMessagesController.sink.add(errorMessage);
    });
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
    switch (error.response.statusCode) {
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

  void dispose() {
    _errorsController.close();
    _errorsMessagesController.close();
  }
}
