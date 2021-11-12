import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final tokenRepositoryProvider =
    ChangeNotifierProvider((ref) => TokenRepository());

/// A repository used to handle authentication token `CRUD` operations.
///
/// i.e:`read , presist , delete` using [FlutterSecureStorage].
/// Also expose and modify token state whether it is expired or not.
class TokenRepository with ChangeNotifier {
  //* Dependency
  final FlutterSecureStorage _secureStorage;

  //* State
  String? _authToken;
  bool _isTokenExpired = false;

  //* Getters
  String? get authToken => _authToken;

  /// Token expiry state.
  bool get isTokenExpired => _isTokenExpired;

  //* Constructor
  TokenRepository() : _secureStorage = const FlutterSecureStorage();

  //* Token Methods
  /// Updates token expiry state and [notifyListeners()]
  void updateTokenState({required bool isExpired}) {
    _isTokenExpired = isExpired;
    notifyListeners();
  }

  /// Deletes token from local storage.
  Future<void> deleteToken() async {
    await _secureStorage.delete(key: kAuthToken);
    _authToken = null;
  }

  /// Saves or Updates token in local storage with the given [newToken].
  Future<void> presistToken(String newToken) async {
    _authToken = newToken;
    await _secureStorage.write(key: kAuthToken, value: newToken);
  }

  /// Read token from local storage.
  Future<String?> readToken() async =>
      _authToken = await _secureStorage.read(key: kAuthToken);
}
