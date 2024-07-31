import 'meals.dart';

class Cart {
  Cart({required this.meal, required this.quantity});

  final Meal meal;
  int quantity;

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      meal: Meal.fromJson(json['meal']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meal': meal.toJson(),
      'quantity': quantity,
    };
  }
}
