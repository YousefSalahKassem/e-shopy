import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';

final tokenRepositoryProvider =
    ChangeNotifierProvider((ref) => TokenRepository());

/// [TokenRepository] is used to handle authentication token `CRUD` operations
/// `read , write , delete ` using [FlutterSecureStorage].

class TokenRepository with ChangeNotifier {
  // Dependency
  final FlutterSecureStorage _secureStorage;

  // State
  String _authToken;

  bool _isTokenExpired = false;

  // Getters
  String get authToken => _authToken;
  bool get isTokenExpired => _isTokenExpired;

  // Constructor
  TokenRepository() : _secureStorage = const FlutterSecureStorage();

  // Token Methods
  void updateTokenState({@required bool isExpired}) {
    _isTokenExpired = isExpired;
    notifyListeners();
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: kAuthToken);
    _authToken = null;
  }

  Future<void> presistToken(String newToken) async {
    _authToken = newToken;
    await _secureStorage.write(key: kAuthToken, value: newToken);
  }

  Future<String> readToken() async =>
      _authToken = await _secureStorage.read(key: kAuthToken);
}
