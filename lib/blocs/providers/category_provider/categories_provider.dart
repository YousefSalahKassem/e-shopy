import 'package:flutter_boilerplate/blocs/model/category_model.dart';
import 'package:flutter_boilerplate/blocs/providers/category_provider/i_categories_state.dart';
import 'package:flutter_boilerplate/data/remote/apis/category_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryProvider extends StateNotifier<ICategoriesState> {
  static final provider = StateNotifierProvider((ref) {
    return CategoryProvider._(
      ref.read(CategoryApi.provider),
    );
  });

  final CategoryApi _api;

  CategoryProvider._(this._api) : super(CategoryProviderInitial()) {
    getCategories();
  }

  Future<void> getCategories() async {
    state = CategoryProviderLoading();
    final result = await _api.getCategories();
    if (result.isNotEmpty) {
      state = CategoryProviderLoaded(
        result
            .map(
              (category) => Category.fromJson(category as Map<String, dynamic>),
            )
            .toList(),
      );
    }
  }
}
