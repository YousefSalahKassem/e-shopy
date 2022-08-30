import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart' as core;

class AppEndPoint implements core.EndPoints {

  static final provider = Provider((ref)=>AppEndPoint());

  @override
  // TODO: implement apiUrl
  String get apiUrl => _baseUrl;

  @override
  // TODO: implement baseUrl
  String get baseUrl => _baseUrl;

  static const String _baseUrl = 'https://nehe-ecommerce-api.herokuapp.com/api/v1';


  //  endpoints
  static String productUrl = '$_baseUrl/products/';

  static String categoryUrl = '$_baseUrl/categories/';

  static String searchByCategoryOrNameUrl = '$_baseUrl/products/search/';

  static String searchByCategoryUrl = '$_baseUrl/products/search/category/';

  static String saveOrderUrl = '$_baseUrl/cart/flutter/stripepayment';

  static String payPalRequestUrl = '$_baseUrl/cart/braintree/paypalpayment/';

  static String signUpUrl = '$_baseUrl/users/signup';

  static String signInUrl = '$_baseUrl/users/signin';

  static String checkTokenExpiryUrl = '$_baseUrl/users/checktokenexpiry';

  static String cartUrl = '$_baseUrl/cart/';

  static String getOrdersUrl = '$_baseUrl/cart/orders/user/';

  static String changeNameUrl = '$_baseUrl/users/updatename/';

  static String changeMailUrl = '$_baseUrl/users/updatemail/';

  static String forgotPasswordUrl = '$_baseUrl/users/forgotpassword';


}
