import 'package:flutter_boilerplate/blocs/model/local/address_model.dart';
import 'package:flutter_boilerplate/data/local/database/address_database.dart';
import 'package:flutter_boilerplate/data/local/interface/i_database.dart';
import 'package:flutter_boilerplate/services/local/i_address_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddAddressProvider extends StateNotifier<IAddressState> {
  static final provider = StateNotifierProvider((ref) {
    return AddAddressProvider(
      ref.read(AddressDatabase.provider),
    );
  });
  final IDatabase _database;
  List _data = [];

  AddAddressProvider(this._database) : super(const AddressProviderInitial()) {
    init();
  }

  Future<void> init() async {
    await _database.init();
    fetch();
  }

  Future<void> insert(AddressModel data) async {
    await _database.insert(data.toJson());
    fetch();
  }

  Future<void> fetch() async {
    _data = List.of(await _database.fetch())
        .cast<Map<String, dynamic>>()
        .map(AddressModel.fromJson)
        .toList();
    state = AddressProviderLoaded(List.unmodifiable(_data));
  }

  Future<void> delete(String street) async {
    await _database.removeItem(street);
    _data.removeWhere((element) => element.street == street);
    state = AddressProviderLoaded(List.unmodifiable(_data));
  }
}
