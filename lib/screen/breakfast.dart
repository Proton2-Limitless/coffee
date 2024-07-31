import 'package:coffee/model/meals.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:coffee/screen/breakfast_meal.dart';

class Breakfast extends StatelessWidget {
  const Breakfast({
    super.key,
    required this.meals,
    required this.imageUrl,
    required this.id,
  });

  final List<Meal> meals;
  final String imageUrl;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 240, 238, 238),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 40),
                  clipBehavior: Clip.hardEdge,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 360,
                        child: FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "Breakfast",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: 300,
                        child: const Text(
                          "Perfectly baked, hearty and full of flavour - that's how to start a morning ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 60,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return BreakfastMeal(meals, id);
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 65),
                backgroundColor: Colors.green[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Full Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
