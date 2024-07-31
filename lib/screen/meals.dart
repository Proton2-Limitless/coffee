import 'package:coffee/model/meals.dart';
import 'package:flutter/material.dart';
import 'package:coffee/screen/breakfast.dart';
import 'package:coffee/screen/other_meals.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({
    super.key,
    required this.meals,
    required this.coffeeDetails,
  });

  final List<Meal> meals;
  final Map<String, String> coffeeDetails;

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  String coffeeFilter = "All";
  List<String> coffeeFilters = ["All", "Cold Coffee", "Hot Coffee"];
  List<Meal> filteredMeals = [];

  @override
  void initState() {
    super.initState();
    filteredMeals = widget.meals;
  }

  _selectCoffeeFilter(String newfilter) {
    setState(() {
      coffeeFilter = newfilter;
      if (widget.coffeeDetails["title"] == "Coffee") {
        if (coffeeFilter == "Cold Coffee") {
          filteredMeals =
              widget.meals.where((meal) => meal.temp == Temp.cold).toList();
        } else if (coffeeFilter == "Hot Coffee") {
          filteredMeals =
              widget.meals.where((meal) => meal.temp == Temp.hot).toList();
        } else {
          filteredMeals = widget.meals;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Breakfast(
      meals: widget.meals,
      imageUrl: widget.coffeeDetails["image"]!,
      id: widget.coffeeDetails["id"]!,
    );

    if (widget.coffeeDetails['title'] != "Breakfast") {
      content = OtherMeals(
        coffeeDetails: widget.coffeeDetails,
        coffeeFilter: coffeeFilter,
        coffeeFilters: coffeeFilters,
        filteredMeals: filteredMeals,
        selectCoffeeFilter: _selectCoffeeFilter,
      );
    }
    return Scaffold(body: content);
  }
}

// use with stack parent
// class DraggableWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize:
//           0.1, // Initial height of the draggable sheet (10% of the screen height)
//       minChildSize: 0.1, // Minimum height of the draggable sheet
//       maxChildSize: 1, // Maximum height of the draggable sheet
//       builder: (BuildContext context, ScrollController scrollController) {
//         return Container(
//           color: Colors.grey[300], // Adjust as needed
//           child: ListView.builder(
//             controller: scrollController,
//             itemCount: 20, // Example number of available meals
//             itemBuilder: (BuildContext context, int index) {
//               return ListTile(
//                 title: Text('Meal ${index + 1}'),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
