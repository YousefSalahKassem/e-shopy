import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/model/product_model.dart';
import 'package:flutter_boilerplate/blocs/providers/favourite_provider.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/themes/flavor/light/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    super.key,
    this.width = 150,
    this.aspectRatio = 1.02,
    required this.product,
  });

  final double width;
  final double aspectRatio;
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =  ref.watch(FavouriteProvider.provider.notifier);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.heightR(0.01)),
      padding: EdgeInsets.symmetric(
        horizontal: context.heightR(0.02),
      ),
      child: GestureDetector(
        onTap: () {
          AutoRouter.of(context).push(DetailsRoute(product: product));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(context.heightR(0.01)),
                child: Hero(
                  tag: product.name,
                  child: CachedNetworkImage(
                      imageUrl: product.imageUrl, fit: BoxFit.cover,),
                ),
              ),
            ),
            Text(
              product.name,
              style: const TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                    fontSize: context.heightR(0.02),
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                        controller.insert(product);
                  },
                  child: Container(
                    padding: EdgeInsets.all(context.heightR(0.01)),
                    height: context.heightR(0.03),
                    width: context.heightR(0.03),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/icons/Heart Icon_2.svg",
                        color: controller.checkFavorite(product)?const Color(0xFFFF4848):Colors.white,),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
