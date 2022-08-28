import 'package:flutter_boilerplate/blocs/model/user.dart';

/// TODO move  this state inside dir bloc/provider/$your_provider_name/$your_state.dart like => addressProvider(address_notifier.dart , address_state.dart)

abstract class IAuthState {
  const IAuthState();
}

class AuthProviderInitial extends IAuthState {
  const AuthProviderInitial();
}

class AuthProviderLoading extends IAuthState {
  const AuthProviderLoading();
}

class AuthProviderLoaded extends IAuthState {
  final User user;
  const AuthProviderLoaded(this.user);
}
