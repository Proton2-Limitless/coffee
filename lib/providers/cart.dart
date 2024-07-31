import 'package:coffee/model/cart.dart';
import 'package:coffee/model/meals.dart';
import 'package:coffee/persistence.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifierProvider extends StateNotifier<List<Cart>> {
  CartNotifierProvider() : super([]) {
    _loadCartItems();
  }

  final PersistenceService _persistenceService = PersistenceService();

  List<Cart> get cartItems => state;

  void _loadCartItems() async {
    state = await _persistenceService.loadCart();
  }

  addToCart(Meal meal) {
    final existingMeal = state.firstWhere((cart) => cart.meal == meal,
        orElse: () => Cart(meal: meal, quantity: 0));

    if (existingMeal.quantity == 0) {
      state = [...state, Cart(meal: meal, quantity: 1)];
    } else {
      existingMeal.quantity;
      state = [...state];
    }

    _persistenceService.saveCart(state);
  }

  removefromCart(meal) {
    state = state.where((element) => element.meal.id != meal.id).toList();
    _persistenceService.saveCart(state);
  }
}

final cartNotifierProvider =
    StateNotifierProvider<CartNotifierProvider, List<Cart>>(
  (ref) => CartNotifierProvider(),
);
