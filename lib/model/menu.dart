class MenuCategory {
  const MenuCategory({
    required this.id,
    required this.title,
    this.image =
        "https://cdn.pixabay.com/photo/2013/08/11/19/46/coffee-171653_1280.jpg",
    required this.description,
  });

  final String id;
  final String title;
  final String image;
  final String description;
}
