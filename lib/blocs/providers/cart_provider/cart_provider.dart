import 'package:flutter_boilerplate/blocs/model/local/cart_model.dart';
import 'package:flutter_boilerplate/blocs/model/product_model.dart';
import 'package:flutter_boilerplate/blocs/providers/cart_provider/i_cart_state.dart';
import 'package:flutter_boilerplate/blocs/providers/product_provider/product_provider.dart';
import 'package:flutter_boilerplate/data/local/database/cart_database.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartProvider extends StateNotifier<ICartState> {
  static final provider = StateNotifierProvider((ref) {
    return CartProvider(
      ref.read(CartDatabase.provider),
      ref.read(ProductProvider.provider.notifier),
    );
  });
  final CartDatabase _database;
  final ProductProvider _productProvider;
  List<CartModel> _data = [];
  double total = 0;

  CartProvider(this._database, this._productProvider) : super(CartInitial()) {
    init();
  }

  Future<void> init() async {
    await _database.init();
    fetch();
  }

  Future<void> insert(CartModel product) async {
    await _database.checkIfItemExists(product).then((value) async {
      if (value) {
        increment(product);
      } else {
        _database.insert(product.toJson());
        UiHelpers.showNotification(
          '${getProduct(product.id).name} added to cart',
          isError: false,
        );
      }
      fetch();
    });
  }

  Future<void> fetch() async {
    _data = List.of(await _database.fetch())
        .cast<Map<String, dynamic>>()
        .map(CartModel.fromJson)
        .toList();
    state = CartLoaded(List.unmodifiable(_data));
  }

  Future<void> delete(String id) async {
    await _database.removeItem(id);
    _data.removeWhere((element) => element.id == id);
    state = CartLoaded(List.unmodifiable(_data));
  }

  Future<void> clearCart() async {
    await _database.removeAll();
    total = 0;
    state = CartLoaded([]);
  }

  Future<void> increment(CartModel product) async {
    product.quantity++;
    await _database.update(product.toJson());
    state = CartLoaded(List.unmodifiable(_data));
  }

  Future<void> decrement(CartModel product) async {
    if (product.quantity > 1) {
      product.quantity--;
      await _database.update(product.toJson());
      state = CartLoaded(_data);
    } else {
      await delete(product.id);
    }
  }

  double totalPrice() {
    total = 0;
    for (final element in _data) {
      total += getProduct(element.id).price * element.quantity;
    }
    return total;
  }

  Product getProduct(String id) {
    return _productProvider.result.where((element) => element.id == id).first;
  }
}
