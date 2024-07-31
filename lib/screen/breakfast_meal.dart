import 'package:coffee/model/meals.dart';
import 'package:coffee/providers/favorite.dart';
import 'package:coffee/screen/each_meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class BreakfastMeal extends ConsumerWidget {
  const BreakfastMeal(this.meals, this.id, {super.key});

  final List<Meal> meals;
  final String id;

  void _navigateToEachMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => EachMeal(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final breakfastFavoriteMeals = ref.watch(breakfastFavoriteMealProvider(id));
    Widget content = const Text("No Favorite for now");
    if (breakfastFavoriteMeals.isNotEmpty) {
      content = SizedBox(
        height: 300,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  Meal meal = breakfastFavoriteMeals[index];
                  return InkWell(
                    onTap: () {
                      _navigateToEachMeal(context, meal);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: SizedBox(
                        width: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 170,
                              height: 180,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: FadeInImage(
                                placeholder: MemoryImage(kTransparentImage),
                                image: NetworkImage(meal.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              meal.title,
                              maxLines: 2,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              meal.subtitle,
                              maxLines: 2,
                              softWrap: true,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: List.generate(
                                        meal.rating.ceil(),
                                        (index) {
                                          return const Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 20,
                                          );
                                        },
                                      ),
                                    ),
                                    Row(
                                      children: List.generate(
                                        5 - meal.rating.ceil(),
                                        (index) {
                                          return const Icon(
                                            Icons.star,
                                            color: Colors.black12,
                                            size: 20,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '\$${meal.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: breakfastFavoriteMeals.length,
              ),
            )
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Breakfast",
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Favourite",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            content,
            const Text(
              "Menu",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: meals.length,
                itemBuilder: (ctx, index) {
                  final Meal meal = meals[index];
                  return InkWell(
                    onTap: () {
                      _navigateToEachMeal(context, meal);
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 130,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: FadeInImage(
                                  placeholder: MemoryImage(kTransparentImage),
                                  image: NetworkImage(meal.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    top: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 110,
                                            child: Text(
                                              meal.title,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '\$${meal.price.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        meal.subtitle,
                                        // maxLines: 2,
                                        // softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
