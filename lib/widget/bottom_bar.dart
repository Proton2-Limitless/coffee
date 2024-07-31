import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.selectScreen,
    required this.screenIndex,
  });

  final void Function(int val) selectScreen;
  final int screenIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(80),
          topRight: Radius.circular(80),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
            offset: const Offset(0, 20),
            blurRadius: 30,
          ),
        ],
      ),
      height: 70,
      child: BottomNavigationBar(
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        onTap: (int val) {
          selectScreen(val);
        },
        elevation: 8,
        selectedFontSize: 0,
        currentIndex: screenIndex,
        selectedItemColor: Colors.orange[300],
        unselectedItemColor: const Color.fromARGB(204, 144, 133, 133),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
