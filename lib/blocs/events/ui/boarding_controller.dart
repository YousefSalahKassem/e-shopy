import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/model/local/boarding_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardingController with ChangeNotifier {
  static final boardingProvider =
      ChangeNotifierProvider<BoardingController>((ref) => BoardingController());

  int _currentIndex = 0;
  final PageController _pageController = PageController();

  int get currentIndex => _currentIndex;

  PageController get pageIndex => _pageController;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future<bool> nextPage() async {
    if (_currentIndex != getBoardings.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      return false;
    }
    notifyListeners();
    return true;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
