import 'package:coffee/model/menu.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MenuCategoryGridItem extends StatelessWidget {
  const MenuCategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  final MenuCategory category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double availableHeight = constraints.maxHeight;
        double imageHeight = availableHeight * 0.68;

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.hardEdge,
          elevation: 2,
          child: InkWell(
            onTap: () {
              onSelectCategory();
            },
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: imageHeight,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(category.image),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            category.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            category.description,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 106, 102, 102),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
