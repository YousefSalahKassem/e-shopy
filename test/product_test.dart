import 'dart:convert';
import 'package:flutter_boilerplate/data/remote/apis/product_api.dart';
import 'package:flutter_boilerplate/data/remote/constants/app_endpoints.dart';
import 'package:flutter_boilerplate/data/token_holder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart' as core;

import 'fixtures/fixture_reader.dart';

void main() {
  final provider = ProviderContainer(
    overrides: [
      core.EndPoints.provider.overrideWithValue(AppEndPoint()),
      core.ITokenHolder.provider.overrideWithProvider(TokenHolder.provider),
    ],
  );
  final product = json.decode(fixture('product_by_name'));

  group('Product Operations', () {
    test("get all products", () {
      final repo = provider.read(ProductApi.provider);
      expect(repo.getAllProducts(), completes);
    });
    test('get product by name', () async{
      final repo = provider.read(ProductApi.provider);
      expect(await repo.getProductByCategoryOrName('Teddy Bear'), product);
    });
    test('product not found', () async{
      final repo = provider.read(ProductApi.provider);
      expect(await repo.getProductByCategoryOrName('Teddy Bears'), []);
    });
  });
}
