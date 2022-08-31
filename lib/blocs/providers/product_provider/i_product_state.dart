import 'package:flutter_boilerplate/blocs/model/product_model.dart';

abstract class IProductState{
  const IProductState();
}

class ProductProviderInitial extends IProductState{}

class ProductProviderLoading extends IProductState{}

class ProductProviderLoaded extends IProductState{
  final List<Product> products;
  const ProductProviderLoaded(this.products);
}

class ProductProviderError extends IProductState{}
