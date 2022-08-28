import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/model/local/boarding_model.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardingController with ChangeNotifier {
  static final boardingProvider =
      ChangeNotifierProvider<BoardingController>((ref) => BoardingController());

  int _currentIndex = 0;

  /// TODO _pageController need to dispose
  final PageController _pageController = PageController();

  int get currentIndex => _currentIndex;
  PageController get pageIndex => _pageController;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  /// TODO not save to pass context in controller based on sparate the ui from your logic
  void nextPage(BuildContext context) {
    if (_currentIndex == getBoardings.length - 1) {
      context.replaceRoute(const LoginRoute());
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
    notifyListeners();
  }
}
