import 'package:flutter_boilerplate/blocs/model/product_model.dart';
import 'package:flutter_boilerplate/blocs/providers/product_provider/i_product_state.dart';
import 'package:flutter_boilerplate/data/local/database/favorite_database.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteProvider extends StateNotifier<IProductState> {
  static final provider = StateNotifierProvider((ref) {
    return FavouriteProvider(
      ref.read(FavoriteDatabase.provider),
    );
  });
  final FavoriteDatabase _database;
  List<Product> _data = [];

  FavouriteProvider(this._database)
      : super(ProductProviderInitial()) {
    init();
  }

  Future<void> init() async {
    await _database.init();
    fetch();
  }

  Future<void> insert(Product product) async {
    await _database.checkFavorite(product).then((value) {
      if (value) {
        delete(product.name);
      } else {
        _database.insert(product.toJson());
        fetch();
        UiHelpers.showNotification('${product.name} added to favorites',isError: false);
      }
    });
  }

  Future<void> fetch() async {
    _data = List.of(await _database.fetch())
        .cast<Map<String, dynamic>>()
        .map(Product.fromJson)
        .toList();
    state = ProductProviderLoaded(List.unmodifiable(_data));
  }

  Future<void> delete(String name) async {
    await _database.removeItem(name);
    _data.removeWhere((element) => element.name == name);
    state = ProductProviderLoaded(List.unmodifiable(_data) );
  }

  Future<void> deleteAll() async {
    await _database.removeAll();
    state = const ProductProviderLoaded([]);
  }

  bool checkFavorite(Product product) {
    return _data.contains(product);
  }
}
