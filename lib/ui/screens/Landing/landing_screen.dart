import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/events/ui/landing_controller.dart';
import 'package:flutter_boilerplate/themes/dimensions.dart';
import 'package:flutter_boilerplate/ui/screens/Landing/cart_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Landing/favourite_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Landing/home_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Landing/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: _landingBody(ref),
      bottomNavigationBar: _customBottomNavigationBar(ref),
    );
  }
}

Widget _landingBody(WidgetRef ref){
  return IndexedStack(
    index: ref.read(LandingController.provider).currentIndex,
    children: const [
      HomeScreen(),
      FavouriteScreen(),
      CartScreen(),
      ProfileScreen()
    ],
  );
}

Widget _customBottomNavigationBar(WidgetRef ref) {
  return DecoratedBox(
    decoration: const BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(30), topLeft: Radius.circular(30),),
      boxShadow: [
        BoxShadow(color: Colors.black38, spreadRadius: 2, blurRadius: 5),
      ],
    ),
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(radiusLarge),
        topRight: Radius.circular(radiusLarge),
      ),
      child: BottomNavigationBar(
        onTap: (index) => ref.read(LandingController.provider).setCurrentIndex(index),
        currentIndex: ref.watch(LandingController.provider).currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    ),
  );
}
