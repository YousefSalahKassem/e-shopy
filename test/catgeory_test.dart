import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/data/remote/apis/category_api.dart';
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
  final categories = json.decode(fixture('categories'));
  test("get all categories", () async{
    final repo = provider.read(CategoryApi.provider);
    expect(await repo.getCategories(), categories);
    debugPrint(categories.toString());
  });
}
