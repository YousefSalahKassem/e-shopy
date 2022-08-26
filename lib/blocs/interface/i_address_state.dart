import 'package:flutter_boilerplate/blocs/model/local/address_model.dart';

abstract class IAddressState {
  const IAddressState();
}

class AddressProviderInitial extends IAddressState {
  const AddressProviderInitial();
}

class AddressProviderLoading extends IAddressState {
  const AddressProviderLoading();
}

class AddressProviderLoaded extends IAddressState {
  final List<AddressModel> addresses;
  const AddressProviderLoaded(this.addresses);
}
