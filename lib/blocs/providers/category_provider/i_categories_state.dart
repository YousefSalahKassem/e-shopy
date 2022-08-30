import 'package:flutter_boilerplate/blocs/model/category_model.dart';

abstract class ICategoriesState{
  const ICategoriesState();
}

class CategoryProviderInitial extends ICategoriesState{}

class CategoryProviderLoading extends ICategoriesState{}

class CategoryProviderLoaded extends ICategoriesState{
  final List<Category> categories;
  const CategoryProviderLoaded(this.categories);
}

class CategoryProviderError extends ICategoriesState{}
