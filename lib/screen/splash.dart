import 'package:coffee/widget/background_image.dart';
import 'package:coffee/widget/discover.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _switchWidget();
  }

  Widget splashWidget = Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: Colors.white,
            size: 100,
          ),
        ),
      ],
    ),
  );

  _switchWidget() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    setState(() {
      splashWidget = const Discover();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(
          image: "assets/images/2.jpg",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: splashWidget,
          ),
        )
      ],
    );
  }
}
