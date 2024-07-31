import 'package:coffee/model/menu.dart';
import 'package:coffee/screen/meals.dart';
import 'package:coffee/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:coffee/widget/menu_category_items.dart';
import 'package:coffee/data/dummy_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = "Coffee";
  _selectMenu(category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void _selectCategory(BuildContext context, MenuCategory category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Map<String, String> coffeeDetails = {
      "image": category.image,
      "title": category.title,
      "description": category.description,
      "id": category.id
    };

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          coffeeDetails: coffeeDetails,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> places = ["Kano, Nigeria", "Okene, Usa"];
    String selectedPlace = "Kano, Nigeria";

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Location",
                      style: TextStyle(color: Colors.white),
                    ),
                    DropdownMenu<String>(
                      width: 160,
                      initialSelection: selectedPlace,
                      textStyle: const TextStyle(color: Colors.white),
                      inputDecorationTheme: const InputDecorationTheme(
                        border: InputBorder.none,
                        iconColor: Colors.white,
                      ),
                      onSelected: (String? value) {
                        setState(() {
                          selectedPlace = value!;
                        });
                      },
                      dropdownMenuEntries:
                          places.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: TextFieldWidget(
                            containerColor: Color.fromARGB(255, 67, 63, 63),
                            contentColor: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.candlestick_chart,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 35),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.hardEdge,
                      elevation: 10,
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/2.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange[600],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      "Promo",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Buy one get \none FREE",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 500,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...availableCategories.map(
                      (val) {
                        return SizedBox(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: selectedCategory == val.title
                                  ? Colors.deepOrange[500]
                                  : null,
                            ),
                            onPressed: () {
                              _selectMenu(val.title);
                            },
                            child: Text(
                              val.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selectedCategory == val.title
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3.5 / 5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final category = availableCategories[index];
                return MenuCategoryGridItem(
                  category: category,
                  onSelectCategory: () {
                    _selectCategory(context, category);
                  },
                );
              },
              childCount: availableCategories.length,
            ),
          ),
        ),
      ],
    );
  }
}
