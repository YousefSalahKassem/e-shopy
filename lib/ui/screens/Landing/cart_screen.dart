import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/model/local/cart_model.dart';
import 'package:flutter_boilerplate/blocs/providers/cart_provider/cart_provider.dart';
import 'package:flutter_boilerplate/blocs/providers/cart_provider/i_cart_state.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/ui/widgets/default_button.dart';
import 'package:flutter_boilerplate/ui/widgets/outline_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              LocaleKeys.yourCart.tr(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.trash,
              color: Colors.red,
            ),
            onPressed: () {
              ref.watch(CartProvider.provider.notifier).clearCart();
            },
          ),
        ],
      ),
      body: const _CartBody(),
    );
  }
}

class _CartBody extends ConsumerWidget {
  const _CartBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(CartProvider.provider);
    final notifier = ref.read(CartProvider.provider.notifier);
    return Column(
      children: [
        if (list is CartLoaded)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.heightR(0.02),
              vertical: context.heightR(0.02),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: list.cartItems.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    notifier.delete(list.cartItems[index].id);
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.trash,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            notifier.delete(list.cartItems[index].id);
                          },
                        ),
                      ],
                    ),
                  ),
                  child: _CartItem(
                    item: list.cartItems[index],
                  ),
                );
              },
            ),
          )
        else
          const Center(child: CircularProgressIndicator()),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.heightR(0.02),
            vertical: context.heightR(0.01),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "\$${notifier.totalPrice()}",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
              SizedBox(height: context.heightR(0.01)),
              DefaultButton(
                text: 'Checkout',
                press: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}

class _CartItem extends ConsumerWidget {
  final CartModel item;

  const _CartItem({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list= ref.watch(CartProvider.provider.notifier);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.heightR(0.01)),
      child: Row(
        children: [
          SizedBox(
            width: context.heightR(0.09),
            child: AspectRatio(
              aspectRatio: 0.88,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  list.getProduct(item.id).imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                list.getProduct(item.id).name,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Text(
                '\$${list.getProduct(item.id).price}',
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              const SizedBox(height: 10),
              _CartCounter(
                item: item,
              )
            ],
          )
        ],
      ),
    );
  }
}

class _CartCounter extends ConsumerWidget {
  final CartModel item;

  const _CartCounter({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(CartProvider.provider.notifier);
    return Center(
      child: Row(
        children: [
          OutLineButton(
            icon: Icons.remove,
            onPressed: () {
              notifier.decrement(item);
            },
          ),
          const SizedBox(width: 10),
          Text(
            '${item.quantity}',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          OutLineButton(
            icon: Icons.add,
            onPressed: () {
              notifier.increment(item);
            },
          ),
        ],
      ),
    );
  }
}
