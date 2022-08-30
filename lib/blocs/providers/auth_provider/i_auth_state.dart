import 'package:flutter_boilerplate/blocs/model/user.dart';

abstract class IAuthState{
  const IAuthState();
}
class AuthProviderInitial extends IAuthState{
  const AuthProviderInitial();
}
class AuthProviderLoading extends IAuthState{
  const AuthProviderLoading();
}
class AuthProviderLoaded extends IAuthState{
  final User user;
  const AuthProviderLoaded(this.user);
}
