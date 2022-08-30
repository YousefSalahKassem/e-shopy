import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/providers/favourite_provider.dart';
import 'package:flutter_boilerplate/blocs/providers/product_provider/i_product_state.dart';
import 'package:flutter_boilerplate/ui/widgets/product_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(FavouriteProvider.provider);
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Favourite", style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete,color: Colors.red,),
            onPressed: () {
              ref.watch(FavouriteProvider.provider.notifier).deleteAll();
            },
          ),
        ],
      ),
      body: controller is ProductProviderLoaded
          ? Container(
              height: context.heightR(1),
              width: context.heightR(1),
              padding: EdgeInsets.symmetric(vertical: context.heightR(.01)),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: controller.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 1,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => ProductCard(
                  product: controller.products[index],
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
