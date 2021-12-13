import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_boilerplate/blocs/events/ui/ui_event_bus_ovelay.dart';
import 'package:flutter_boilerplate/exceptions/custom_dio_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A [mixin] for to handle REST API error
///
/// It responsible for fire a message

final dioErrorHandlerProviderRef =
    Provider<DioErrorHandler>((ref) => DioErrorHandler(ref.read(uiEventBusProviderRef)));

class DioErrorHandler {
  final EventBus _uiEventBus;

  const DioErrorHandler(this._uiEventBus);

  void handle(DioError error) {
    _uiEventBus.fire(tr('dio_error.${CustomDioException.fromDioError(error)}'));
    if (error.response != null) {
      final Response response = error.response!;
      final decodedResponse = json.decode(response.toString());
      if (decodedResponse is Map<String, dynamic>) {
        final data = decodedResponse;
        if (data.containsKey('message')) {
          _uiEventBus.fire(data['message']);
        } else if (data.containsKey('error')) {
          _uiEventBus.fire(data['error']);
        }
      }
    }
  }
}
