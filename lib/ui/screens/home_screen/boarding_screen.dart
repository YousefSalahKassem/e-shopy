import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/ui/boarding_controller.dart';
import 'package:flutter_boilerplate/blocs/model/boarding_model.dart';
import 'package:flutter_boilerplate/ui/widgets/default_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class BoardingScreen extends ConsumerWidget {
  const BoardingScreen({Key? key}) : super(key: key);

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
                  ref
                      .watch(BoardingController.boardingProvider)
                      .setCurrentIndex(
                    currentIndex,
                  );
                },
                itemBuilder: (context, index) =>
                    _splashContent(context, getBoardings[index]),
              ),),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.height * 0.02),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        getBoardings.length,
                            (index) => _buildDots(context,index,controller),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
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
        )
      ),
    );
  }
}

Widget _splashContent(BuildContext context, Boarding boarding) {
  return Column(
    children: <Widget>[
      const Spacer(),
      const Text(
        "Shopify",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
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

Widget _buildDots(BuildContext context, int index, BoardingController controller) {
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
