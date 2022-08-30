import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/model/category_model.dart';
import 'package:flutter_boilerplate/blocs/providers/category_provider/categories_provider.dart';
import 'package:flutter_boilerplate/blocs/providers/category_provider/i_categories_state.dart';
import 'package:flutter_boilerplate/blocs/providers/product_provider/i_product_state.dart';
import 'package:flutter_boilerplate/blocs/providers/product_provider/product_provider.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/themes/flavor/light/colors.dart';
import 'package:flutter_boilerplate/ui/widgets/icon_botton_with_counter.dart';
import 'package:flutter_boilerplate/ui/widgets/product_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.heightR(.04)),
              const _HomeHeader(),
              SizedBox(height: context.heightR(.03)),
              const _Categories(),
              SizedBox(height: context.heightR(.03)),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: context.heightR(0.02)),
                child: Text(
                  LocaleKeys.popularProducts.tr(),
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(height: context.heightR(.03)),
              const _Products(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeHeader extends ConsumerWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.heightR(0.01)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class _SearchField extends ConsumerWidget {
  const _SearchField ();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.widthR(0.6),
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        style: Theme.of(context).textTheme.headline5,
        onChanged: (value)=>ref.watch(ProductProvider.provider.notifier).getProductByName(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: context.heightR(0.02),
            vertical: context.heightR(0.01),
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: LocaleKeys.searchProduct.tr(),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

class _Categories extends ConsumerWidget {
  const _Categories();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(CategoryProvider.provider);
    if (state is CategoryProviderLoaded) {
      final categories = state.categories;
      return Padding(
        padding: EdgeInsets.all(context.heightR(0.01)),
        child: SizedBox(
          height: context.heightR(0.12),
          width: context.widthR(1),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              if (index > 0) {
                return CategoryCard(
                  icon: listIcons[index],
                  text: categories[index].category,
                  press: () {
                    AutoRouter.of(context).push(
                      CategoryRoute(category: categories[index].category),
                    );
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
  });

  final String? text;
  final IconData icon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: context.heightR(0.08),
        margin: EdgeInsets.only(right: context.heightR(0.03)),
        child: Column(
          children: [
            Container(
              height: context.heightR(0.08),
              width: context.heightR(0.08),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(icon),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text!,
              textAlign: TextAlign.center,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}

class _Products extends ConsumerWidget {
  const _Products();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ProductProvider.provider);
    if (state is ProductProviderLoaded) {
      final products = state.products;
      return SizedBox(
        height: context.heightR(.5),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 1,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => ProductCard(
            product: products[index],),
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
