import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_boilerplate/blocs/events/ui/ui_event_bus_ovelay.dart';
import 'package:flutter_boilerplate/blocs/events/ui/ui_events.dart';
import 'package:flutter_boilerplate/exceptions/custom_dio_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

/// Handle REST API error
///
/// It responsible for fire a message
class DioErrorHandler {
  static final provider = Provider<DioErrorHandler>(
    (ref) => DioErrorHandler._(ref.read(uiEventBusProviderRef)),
  );

  final EventBus _uiEventBus;

  const DioErrorHandler._(this._uiEventBus);

  void handle(DioError error) {
    if (error.type == DioErrorType.other) {
      _uiEventBus.fire(const InternetConnectionFailedEvent());
    } else {
      _uiEventBus.fire(
        tr('dio_error.${CustomDioException.fromDioError(error)}'),
      );
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
}
