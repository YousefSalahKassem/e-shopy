import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class TokenHolder implements ITokenHolder {

  final TokenNotifier _tokenNotifier;
  static final provider = Provider<ITokenHolder>((ref) {
    return TokenHolder(ref.watch(TokenNotifier.provider.notifier));
  });


  TokenHolder(this._tokenNotifier);

  @override
  String? get accessToken {
    debugPrint("get accessToken = ${_tokenNotifier.state}");
    return _tokenNotifier.state;
  }

}

class TokenNotifier extends StateNotifier<String?>{
  static final provider = StateNotifierProvider<TokenNotifier,String?>((ref) {
    return TokenNotifier();
  });
  TokenNotifier() : super(null);

  @override
  set state(String? value) {
    super.state = value;
  }

  @override
  String? get state => super.state;
}
