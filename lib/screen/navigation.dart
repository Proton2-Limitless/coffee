import 'package:coffee/screen/checkout.dart';
import 'package:coffee/screen/favorite.dart';
import 'package:coffee/screen/home.dart';
import 'package:coffee/screen/profile.dart';
import 'package:coffee/widget/bottom_bar.dart';
import 'package:coffee/widget/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Navigation extends ConsumerStatefulWidget {
  const Navigation({super.key});

  @override
  ConsumerState<Navigation> createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation> {
  String title = "Home";
  int _initialIndex = 0;
  final List<Widget> bottomBarScreen = [
    const Home(),
    const Favorite(),
    const Checkout(),
    const Profile()
  ];

  _selectScreen(int value) {
    setState(() {
      _initialIndex = value;
      if (_initialIndex == 0) {
        title = "Home";
      } else if (_initialIndex == 1) {
        title = "Favorite";
      }
      if (_initialIndex == 2) {
        title = "Checkout";
      }
      if (_initialIndex == 3) {
        title = "Profile";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(title),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: const MainDrawer(),
      body: bottomBarScreen[_initialIndex],
      bottomNavigationBar: BottomBar(
        selectScreen: _selectScreen,
        screenIndex: _initialIndex,
      ),
    );
  }
}
