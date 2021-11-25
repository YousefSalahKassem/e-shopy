import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_boilerplate/blocs/events/ui/ui_event_singleton.dart';
import 'package:flutter_boilerplate/exceptions/custom_dio_exception.dart';

/// A [mixin] for to handle REST API error
///
/// It responsible for fire a message

mixin DioErrorHandler {
  static void handle(DioError error) {
    UIEventSingleton.eventBus
        .fire(tr('dio_error.${CustomDioException.fromDioError(error)}'));
    if (error.response != null) {
      final Response response = error.response!;
      final decodedResponse = json.decode(response.toString());
      if (decodedResponse is Map<String, dynamic>) {
        final data = decodedResponse;
        if (data.containsKey('message')) {
          UIEventSingleton.eventBus.fire(data['message']);
        } else if (data.containsKey('error')) {
          UIEventSingleton.eventBus.fire(data['error']);
        }
      }
    }
  }
}
