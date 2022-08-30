import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/providers/product_provider/product_provider.dart';
import 'package:flutter_boilerplate/ui/widgets/product_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CategoryScreen extends ConsumerWidget {
  final String category;
  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Consumer(
          builder: (_, ref, __) {
            return ref.watch(filterFuture(category)).when(
              data: (data) => GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: data[index]);
                },
              ),
              error: (error, stack) => Center(child: Text(error.toString())),
              loading: () => const CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}
