import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/events/ui/boarding_controller.dart';
import 'package:flutter_boilerplate/blocs/model/local/boarding_model.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/ui/widgets/default_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class BoardingScreen extends ConsumerWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(BoardingController.boardingProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: getBoardings.length,
                controller: controller.pageIndex,
                onPageChanged: (currentIndex) {
                  controller.setCurrentIndex(
                    currentIndex,
                  );
                },
                itemBuilder: (context, index) =>
                    _SplashContent(boarding: getBoardings[index]),
              ),),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.heightR(0.02)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        getBoardings.length,
                            (index) => _BuildDots(index: index, controller: controller),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                      text: LocaleKeys.next.tr(),
                      press: () {
                        controller.nextPage().then((value) {
                          if (value==true) {
                            AutoRouter.of(context).replace(const LoginRoute());
                          }
                        });
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SplashContent extends StatelessWidget {
  final BoardingModel boarding;
  const _SplashContent({required this.boarding});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          "Shopify",
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(height: context.height * 0.01),
        Text(
          boarding.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(flex: 2),
        Image.asset(
          boarding.image,
          width: context.height * 0.4,
        ),
      ],
    );
  }
}


class _BuildDots extends StatelessWidget {
  final int index;
  final BoardingController controller;
  const _BuildDots({required this.index,required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 6,
      width: controller.currentIndex == index ? context.height*.03 : context.height*0.02,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color:  controller.currentIndex == index ? Colors.orange : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
