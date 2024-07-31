import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            const Color.fromARGB(255, 52, 50, 50).withOpacity(0.1),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }
}
