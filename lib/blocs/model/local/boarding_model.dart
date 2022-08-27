import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';

class Boarding {
  final String title;
  final String image;

  Boarding({required this.title, required this.image});
}

List<Boarding> getBoardings= [
  Boarding(
    title: LocaleKeys.firstGreeting.tr(),
    image: "assets/images/splash_1.png",
  ),
  Boarding(
    title: LocaleKeys.secondGreeting.tr(),
    image: "assets/images/splash_2.png",
  ),
  Boarding(
    title: LocaleKeys.thirdGreeting.tr(),
    image: "assets/images/splash_3.png",
  ),
];
