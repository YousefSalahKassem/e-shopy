import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/events/ui/boarding_controller.dart';
import 'package:flutter_boilerplate/blocs/model/local/boarding_model.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/ui/widgets/default_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class BoardingScreen extends ConsumerWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// TODO this watch will rebuild all the screen then no need to use provider here including button
    /// TODO i think this need more refactor
    /// TODO i think for your logic here to wrap the consumer watcher only on the indicator because pageView will be rebuild with it is controller
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
                  ref
                      .watch(BoardingController.boardingProvider)
                      .setCurrentIndex(
                        currentIndex,
                      );
                },
                itemBuilder: (context, index) =>
                    _splashContent(context, getBoardings[index]),
              ),
            ),
            Expanded(
              /// TODO 1 is the default value for expanded
              flex: 1,
              child: Padding(
                /// TODO for use part of screen here just use context.heightR() that is core package
                padding:
                    EdgeInsets.symmetric(horizontal: context.height * 0.02),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        getBoardings.length,
                        (index) => _buildDots(context, index, controller),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                      text: LocaleKeys.next.tr(),
                      press: () {
                        controller.nextPage(context);
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

/// TODO with official flutter team advice to use stateless class instead of using build widget then render will be better and no need to pass the context
Widget _splashContent(BuildContext context, Boarding boarding) {
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

Widget _buildDots(
    BuildContext context, int index, BoardingController controller) {
  return AnimatedContainer(
    height: 6,
    width: controller.currentIndex == index
        ? context.height * .03
        : context.height * 0.02,
    duration: const Duration(milliseconds: 300),
    decoration: BoxDecoration(
      color: controller.currentIndex == index
          ? Colors.orange
          : const Color(0xFFD8D8D8),
      borderRadius: BorderRadius.circular(3),
    ),
  );
}
