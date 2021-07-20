import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.length > 0
        ? ListView.builder(
            itemBuilder: (ctx, idx) => MealItem(
              id: favoriteMeals[idx].id,
              title: favoriteMeals[idx].title,
              imageUrl: favoriteMeals[idx].imageUrl,
              duration: favoriteMeals[idx].duration,
              complexity: favoriteMeals[idx].complexity,
              affordability: favoriteMeals[idx].affordability,
            ),
            itemCount: favoriteMeals.length,
          )
        : Center(
            child: Text(
                'Oops! You have not added any meals to your favorites yet.'),
          );
  }
}
