import 'package:flutter_boilerplate/blocs/interface/i_address_state.dart';
import 'package:flutter_boilerplate/blocs/model/local/address_model.dart';
import 'package:flutter_boilerplate/data/local/database/address_database.dart';
import 'package:flutter_boilerplate/data/local/interface/i_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddAddressProvider extends StateNotifier<IAddressState> {
  static final provider = StateNotifierProvider((ref) {
    return AddAddressProvider(
      ref.read(AddressDatabase.provider),
    );
  });
  final IDatabase _database;

  AddAddressProvider(this._database) : super(const AddressProviderInitial()){
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
    final List data = await _database.fetch();
    state = AddressProviderLoaded(data.map((e) => AddressModel.fromJson(e as Map<String,dynamic>)).toList());
  }

  Future<void> delete(String street) async {
    await _database.removeItem(street);
    fetch();
  }
}
