import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/model/local/cart_model.dart';
import 'package:flutter_boilerplate/blocs/model/product_model.dart';
import 'package:flutter_boilerplate/blocs/providers/cart_provider/cart_provider.dart';
import 'package:flutter_boilerplate/themes/flavor/light/colors.dart';
import 'package:flutter_boilerplate/ui/widgets/default_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProductImage(product: product),
          ProductDescription(product: product),
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final Product product;
  const ProductImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: product.name,
          child: Image.network(product.imageUrl, fit: BoxFit.cover, height: context.heightR(0.3), width: context.widthR(1)),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: context.heightR(0.02), vertical: context.heightR(0.02)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: context.heightR(0.04),
                width: context.heightR(0.04),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    primary: kPrimaryColor,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    "assets/icons/Back ICon.svg",
                    height: 15,
                  ),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        )
      ],
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
    this.pressOnSeeMore,
  });

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {

    return Expanded(
        child: ColoredBox(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.heightR(0.03)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.heightR(0.02)),
                child: Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(context.heightR(0.015)),
                  width: context.heightR(0.066),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Heart Icon_2.svg",
                    color: const Color(0xFFFF4848),
                    height: context.heightR(0.015),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: context.heightR(0.02),
                  right: context.heightR(0.066),
                ),
                child: Text(
                  product.details,
                  maxLines: 10,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.heightR(0.02),
                  vertical: 10,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Text(
                        "See More Detail",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: kPrimaryColor,),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              _AddToCartButton(product: product),
            ],
          ),
        ),
    );
  }
}

class _AddToCartButton extends ConsumerWidget {
  const _AddToCartButton({
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.heightR(0.02), vertical: context.heightR(0.01)),
      child: DefaultButton(
        text: "Add to Cart",
        press: () {
          ref.read(CartProvider.provider.notifier).insert(
            CartModel(
                quantity: 1,
                id: product.id,
            ),
          );
          AutoRouter.of(context).pop();
        },
      ),
    );
  }
}
