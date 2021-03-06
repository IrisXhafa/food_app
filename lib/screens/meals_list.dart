import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/meal_item.dart';

class MealsList extends StatelessWidget {
  static const String ROUTE = '/category-items';
  final List<Meal> availableMeals;

  MealsList(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final Category category = routeArgs['category'];
    final meals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            meals[index],
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
