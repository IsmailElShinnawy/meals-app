import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-name';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String categoryId = routeArgs['id'];
    final String categoryTitle = routeArgs['title'];

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) => MealItem(
            id: categoryMeals[idx].id,
            title: categoryMeals[idx].title,
            imageUrl: categoryMeals[idx].imageUrl,
            duration: categoryMeals[idx].duration,
            complexity: categoryMeals[idx].complexity,
            affordability: categoryMeals[idx].affordability),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
