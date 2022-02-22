import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/repositories/token_repository.dart';
import 'package:flutter_boilerplate/exceptions/dio_error_handler.dart';
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
  final dioErrorHandler = ref.read(dioErrorHandlerProviderRef);

  return DioClient(dio, tokenRepo, dioErrorHandler);
});

class DioClient {
  //* Dependencies
  final Dio _dio;
  final TokenRepository _tokenRepository;
  final DioErrorHandler _dioErrorHandler;

  //* Constructor
  DioClient(
    this._dio,
    this._tokenRepository,
    this._dioErrorHandler,
  ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        //* Apply an interceptor on API requests error(s)
        onError: (error, handler) async {
          debugPrint(
            'Intercepted an error on\n# Api request : ${error.requestOptions.path}\n# Error message: ${error.message}',
          );

          final isRetry = error.requestOptions.extra['IS_RETRY'];

          if (isRetry != null && error.type == DioErrorType.connectTimeout) {
            try {
              final response = await _retry(error.requestOptions);
              return handler.resolve(response);
            } catch (e) {
              debugPrint(e.toString());
            }
          } else {
            // dio error handle to ui event bus fire messages
            _dioErrorHandler.handle(error);
          }
          return handler.next(error);
        },
      ),
    );
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
    return _dio.fetch<dynamic>(
      requestOptions.copyWith(
        extra: {'IS_RETRY': 1},
      ),
    );
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
