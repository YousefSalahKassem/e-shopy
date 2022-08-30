import 'package:flutter_boilerplate/data/remote/constants/app_endpoints.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart' as core;

class CategoryApi {

  static final provider =Provider((ref){
    return CategoryApi._(ref.watch(core.RemoteClient.provider(null)));
  });

  final core.RemoteClient _remoteClient;

  CategoryApi._(this._remoteClient);

  Future<List> getCategories() async {
    try {
      final url = AppEndPoint.categoryUrl;
      final response = await _remoteClient.request(
        core.RemoteMethod.GET,
        url,
        headers: {'Content-Type': 'application/json'},
        authPolicy: core.RemoteAuthPolicy.prohibited,
      );
      if (response.statusCode == 200) {
        return response.data['data']['categories'] as List;
      } else {
        throw Exception('Failed to get categories');
      }
    } on core.RemoteException catch (e) {
      UiHelpers.showNotification(e.message.toString());
      throw Exception(e.message);
    }
  }

}
