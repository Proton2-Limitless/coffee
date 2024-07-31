enum Affordability {
  affordable,
  pricey,
  luxurious,
}

enum Temp { hot, cold }

class Meal {
  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.description,
    this.temp,
    required this.affordability,
    required this.price,
    required this.rating,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String description;
  Temp? temp;
  final Affordability affordability;
  final double price;
  final double rating;

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      categories: List<String>.from(json['categories']),
      title: json['title'],
      subtitle: json['subtitle'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      temp: json['temp'] != null ? Temp.values[json['temp']] : null,
      affordability: Affordability.values[json['affordability']],
      price: json['price'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categories': categories,
      'title': title,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
      'description': description,
      'temp': temp?.index,
      'affordability': affordability.index,
      'price': price,
      'rating': rating,
    };
  }
}
