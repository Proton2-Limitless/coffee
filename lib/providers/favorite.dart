import 'package:coffee/persistence.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coffee/model/meals.dart';

class FavoriteMealProvider extends StateNotifier<List<Meal>> {
  FavoriteMealProvider() : super([]) {
    _loadFavoriteItems();
  }
  final PersistenceService _persistenceService = PersistenceService();

  List<Meal> get favoriteItems => state;

  void _loadFavoriteItems() async {
    state = await _persistenceService.loadFavorites();
  }

  toggleFavoriteMeal(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
    _persistenceService.saveFavorites(state);
  }
}

final breakfastFavoriteMealProvider =
    Provider.family<List<Meal>, String>((ref, String id) {
  final meals = ref.watch(favoriteMealProvider);
  return meals.where((element) => element.categories.contains(id)).toList();
});

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealProvider, List<Meal>>(
  (ref) => FavoriteMealProvider(),
);
