import 'package:flutter_boilerplate/data/remote/constants/app_endpoints.dart';
import 'package:flutter_boilerplate/data/remote/interface/i_products.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart' as core;

class ProductApi extends IProducts {
  static final provider = Provider.autoDispose(
    (ref) => ProductApi._(
      ref.read(core.RemoteClient.provider(null)),
    ),
  );

  final core.RemoteClient _remoteClient;

  ProductApi._(this._remoteClient);

  @override
  Future<List> getAllProducts() async {
    try {
      final url = AppEndPoint.productUrl;
      final response = await _remoteClient.request(
        core.RemoteMethod.GET,
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        authPolicy: core.RemoteAuthPolicy.prohibited,
      );
      if (response.statusCode == 200) {
        return response.data['data']['products'] as List;
      } else {
        throw Exception('Failed to get products');
      }
    } on core.RemoteException catch (e) {
      UiHelpers.showNotification(e.message.toString());
      throw Exception(e.message);
    }
  }

  @override
  Future<List> getProductByCategory(String category) async {
    try {
      final url = AppEndPoint.searchByCategoryUrl + category;
      final response = await _remoteClient.request(
        core.RemoteMethod.GET,
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        authPolicy: core.RemoteAuthPolicy.prohibited,
      );
      if (response.statusCode == 200) {
        return response.data['data']['result'] as List;
      } else {
        throw Exception('Failed to get products');
      }
    } on core.RemoteException catch (e) {
      UiHelpers.showNotification(e.message.toString());
      throw Exception(e.message);
    }
  }

  @override
  Future<List> getProductByCategoryOrName(String category) async {
    try {
      final url = AppEndPoint.searchByCategoryOrNameUrl + category;
      final response = await _remoteClient.request(
        core.RemoteMethod.GET,
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        authPolicy: core.RemoteAuthPolicy.prohibited,
      );
      if (response.statusCode == 200) {
        return response.data['data']['result'] as List;
      }else {
        throw Exception('Failed to get products');
      }
    } on core.RemoteException catch (e) {
      UiHelpers.showNotification(e.message.toString());
      throw Exception(e.message);
    }
  }
}
