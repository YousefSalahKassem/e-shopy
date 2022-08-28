import 'package:flutter_boilerplate/blocs/model/local/address_model.dart';

/// TODO move  this state inside dir bloc/provider/$your_provider_name/$your_state.dart like => addressProvider(address_notifier.dart , address_state.dart)
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
