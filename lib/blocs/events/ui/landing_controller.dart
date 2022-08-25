import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingController with ChangeNotifier{
  static final provider = ChangeNotifierProvider<LandingController>((ref) => LandingController());
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  int get currentIndex => _currentIndex;
  PageController get pageIndex => _pageController;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
