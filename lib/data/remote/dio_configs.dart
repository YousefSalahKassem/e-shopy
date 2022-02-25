import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/remote/constants/endpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The [Provider] for [DioConfigs] instance used by [Dio]
final dioConfigsProvider = Provider<DioConfigs>((ref) {
  return const DioConfigs(
    receiveTimeout,
    connectionTimeout,
    numberOfRetries,
  );
});

class DioConfigs {
  final int receiveTimeout;
  final int connectionTimeout;
  final int numberOfRetries;
  const DioConfigs(
    this.receiveTimeout,
    this.connectionTimeout,
    this.numberOfRetries,
  );
}
