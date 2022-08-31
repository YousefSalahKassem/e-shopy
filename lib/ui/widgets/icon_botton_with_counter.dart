import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/providers/cart_provider/cart_provider.dart';
import 'package:flutter_boilerplate/blocs/providers/cart_provider/i_cart_state.dart';
import 'package:flutter_boilerplate/themes/flavor/light/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class IconBtnWithCounter extends ConsumerWidget {
  const IconBtnWithCounter({
    super.key,
    required this.svgSrc,
    required this.press,
  });

  final String svgSrc;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(CartProvider.provider);
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(context.heightR(.015)),
            height: context.heightR(.06),
            width: context.heightR(.06),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc, width: context.widthR(.05)),
          ),
          Positioned(
            top: -3,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color(0xFFFF4848),
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: Colors.white),
              ),
              child: Center(
                  child: state is CartLoaded ?Text(
                    state.cartItems.length.toString(),
                    style: TextStyle(
                      fontSize: context.heightR(0.015),
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ): const SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
