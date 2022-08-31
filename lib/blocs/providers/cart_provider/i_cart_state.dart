import 'package:flutter_boilerplate/blocs/model/local/cart_model.dart';

abstract class ICartState {
  const ICartState();
}

class CartInitial extends ICartState {}

class CartLoading extends ICartState {}

class CartLoaded extends ICartState {
  final List<CartModel> cartItems;
  CartLoaded(
    this.cartItems,
  );
}
