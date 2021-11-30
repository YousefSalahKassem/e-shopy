import 'package:dio/dio.dart';

class CustomDioException implements Exception {
  CustomDioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "request_canceled";
        break;
      case DioErrorType.connectTimeout:
        message = "connection_timeout";
        break;
      case DioErrorType.other:
        message = "internet_connection_failed";
        break;
      case DioErrorType.receiveTimeout:
        message = "receive_timeout";
        break;
      case DioErrorType.response:
        message = _handleError(dioError.response!.statusCode!);
        break;
      case DioErrorType.sendTimeout:
        message = "send_timeout";
        break;
      default:
        message = "other";
        break;
    }
  }

  String message = '';

  String _handleError(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'bad_request';
      case 404:
        return 'request_not_found';
      case 401:
        return 'un_auth';

      case 500:
        return 'internal_error';
      default:
        return 'other';
    }
  }

  @override
  String toString() => message;
}
