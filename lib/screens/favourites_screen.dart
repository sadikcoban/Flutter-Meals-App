import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> _favoritesMeals;

  FavouritesScreen(this._favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoritesMeals.isNotEmpty) {
      return Center(
        child: Text("Favourites"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favoritesMeals[index].id,
            title: _favoritesMeals[index].title,
            imageUrl: _favoritesMeals[index].imageUrl,
            duration: _favoritesMeals[index].duration,
            complexity: _favoritesMeals[index].complexity,
            affordability: _favoritesMeals[index].affordability,
          );
        },
        itemCount: _favoritesMeals.length,
      );
    }
  }
}
