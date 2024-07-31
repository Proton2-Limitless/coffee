import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:coffee/model/meals.dart';
import 'package:coffee/model/cart.dart';

class PersistenceService {
  static const _cartKey = 'cart';
  static const _favoritesKey = 'favorites';

  Future<void> saveCart(List<Cart> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson =
        cartItems.map((cart) => jsonEncode(cart.toJson())).toList();
    await prefs.setStringList(_cartKey, cartJson);
  }

  Future<List<Cart>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getStringList(_cartKey) ?? [];
    return cartJson.map((json) => Cart.fromJson(jsonDecode(json))).toList();
  }

  Future<void> saveFavorites(List<Meal> favoriteItems) async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson =
        favoriteItems.map((meal) => jsonEncode(meal.toJson())).toList();
    await prefs.setStringList(_favoritesKey, favoritesJson);
  }

  Future<List<Meal>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];
    return favoritesJson
        .map((json) => Meal.fromJson(jsonDecode(json)))
        .toList();
  }
}
