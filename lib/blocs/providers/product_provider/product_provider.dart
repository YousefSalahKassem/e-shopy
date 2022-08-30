import 'package:flutter_boilerplate/blocs/model/product_model.dart';
import 'package:flutter_boilerplate/blocs/providers/product_provider/i_product_state.dart';
import 'package:flutter_boilerplate/data/remote/apis/product_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductProvider extends StateNotifier<IProductState> {
  static final provider = StateNotifierProvider((ref) {
    return ProductProvider._(
      ref.read(ProductApi.provider),
    );
  });
  final ProductApi _api;
  List<Product> result = [];

  ProductProvider._(this._api) : super(ProductProviderInitial()) {
    getProducts();
  }

  Future<List<Product>> getProducts() async {
    await _api.getAllProducts().then((value) {
      result = value
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
    });
    state = ProductProviderLoaded(result);
    return result;
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    await _api.getProductByCategory(category).then((value) {
      result = value
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
    });
    ProductProviderLoaded(result);
    return result;
  }

  Future<List<Product>> getProductByName(String name) async {
    if (name.isEmpty) {
      return getProducts();
    } else {
      await _api.getProductByCategoryOrName(name).then((value) {
        result = value
            .map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList();
      });
      state = ProductProviderLoaded(result);
      return result;
    }
  }
}

final filterFuture =
    FutureProvider.family<List<Product>, String>((ref, arg) async {
  final provider = ref.read(ProductProvider.provider.notifier);
  final list = await provider.getProductsByCategory(arg);
  return list;
});
