import 'package:coffee/model/meals.dart';
import 'package:coffee/widget/meal_widget.dart';
import 'package:coffee/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class OtherMeals extends StatelessWidget {
  const OtherMeals({
    super.key,
    required this.coffeeDetails,
    required this.filteredMeals,
    required this.coffeeFilters,
    required this.coffeeFilter,
    required this.selectCoffeeFilter,
  });

  final Map<String, String> coffeeDetails;
  final List<Meal> filteredMeals;
  final List<String> coffeeFilters;
  final String coffeeFilter;
  final Function(String coffee) selectCoffeeFilter;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 360,
          child: FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(coffeeDetails["image"]!),
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_outlined),
                color: Colors.black.withOpacity(.5),
                iconSize: 35,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coffeeDetails["title"]!.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          coffeeDetails["description"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(40),
                    right: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    coffeeDetails["title"] == "Coffee"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...coffeeFilters.map(
                                (coffee) => TextButton(
                                  onPressed: () {
                                    selectCoffeeFilter(coffee);
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                  ),
                                  child: Text(
                                    coffee,
                                    style: TextStyle(
                                      color: coffeeFilter == coffee
                                          ? Colors.black
                                          : Colors.black45,
                                      fontSize: 20,
                                      fontWeight: coffeeFilter == coffee
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(
                            height: 10,
                          ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const TextFieldWidget(
                              containerColor: Colors.white,
                              contentColor: Colors.black54,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: filteredMeals.length,
                                itemBuilder: (ctx, index) => MealWidget(
                                  meal: filteredMeals[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
