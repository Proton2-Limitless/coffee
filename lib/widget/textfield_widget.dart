import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.containerColor,
    required this.contentColor,
  });

  final Color containerColor;
  final Color contentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: containerColor,
        border: Border.all(
          color: contentColor,
        ),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search Coffee',
            hintStyle: TextStyle(
              color: contentColor,
            ),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: contentColor,
            ),
          ),
        ),
      ),
    );
  }
}
