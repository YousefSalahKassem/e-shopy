import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/repositories/token_repository.dart';
import 'package:flutter_boilerplate/exceptions/error_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The [Provider] for [Dio] instance throughout the app
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

/// A [Provider] for [DioClient] to handle REST API requests
///
/// It also adds an interceptor for showing a notification on errors
final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(dioProvider);
  final tokenRepo = ref.watch(tokenRepositoryProvider);
  final errorHandler = ref.watch(errorHandlerProvider);

  return DioClient(dio, tokenRepo, errorHandler);
});

class DioClient {
  //* Dependencies
  final Dio _dio;
  final TokenRepository _tokenRepository;
  final ErrorHandler _errorHandler;

  //* Constructor
  DioClient(
    this._dio,
    this._tokenRepository,
    this._errorHandler,
  ) {
    _dio.interceptors.add(InterceptorsWrapper(
        //* Apply an interceptor on API requests , to inject anything on the fly
        onRequest: (options, handler) {},
        //* Apply an interceptor on API requests error(s)
        onError: (error, handler) async {
          debugPrint(
              'Intercepted an error on\n# Api request : ${error.requestOptions.path}\n# Error message: ${error.message}');
          _errorHandler.dispatchDioError(error);

          if (error.type == DioErrorType.connectTimeout) {
            try {
              await _retry(error.requestOptions);
            } catch (e) {
              debugPrint(e.toString());
            }
          }
          return handler.next(error);
        }));
  }

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  // Patch:----------------------------------------------------------------------
  Future<dynamic> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

  // Delete:----------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }

// <---------------------------------------------- Retry Request Implementation
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  // API Headers _____________________________________________________________
  Map<String, String> headersWithToken() => {
        HttpHeaders.authorizationHeader: 'Bearer ${_tokenRepository.authToken}',
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json"
      };

  Map<String, String> jsonHeaders() => {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json"
      };
}
