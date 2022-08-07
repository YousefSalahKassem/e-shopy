import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/remote/constants/endpoints.dart'
    as option;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioConfigs {
  /// The [Provider] for [DioConfigs] instance used by [Dio]
  static final provider = Provider<DioConfigs>((ref) {
    return const DioConfigs._(
      option.receiveTimeout,
      option.connectionTimeout,
      option.numberOfRetries,
    );
  });
  final int receiveTimeout;
  final int connectionTimeout;
  final int numberOfRetries;

  const DioConfigs._(
    this.receiveTimeout,
    this.connectionTimeout,
    this.numberOfRetries,
  );
}
