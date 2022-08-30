import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';

class BoardingModel {
  final String title;
  final String image;

  BoardingModel({required this.title, required this.image});
}

List<BoardingModel> getBoardings= [
  BoardingModel(
    title: LocaleKeys.firstGreeting.tr(),
    image: "assets/images/splash_1.png",
  ),
  BoardingModel(
    title: LocaleKeys.secondGreeting.tr(),
    image: "assets/images/splash_2.png",
  ),
  BoardingModel(
    title: LocaleKeys.thirdGreeting.tr(),
    image: "assets/images/splash_3.png",
  ),
];
