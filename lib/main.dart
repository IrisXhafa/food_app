import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/screens/meals_list.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _appliedFilters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favorites = [];

  _toggleFavorite(Meal meal) {
    this.setState(() {
      if (this.favorites.any((m) => meal.id == m.id)) {
        this.favorites.removeWhere((element) => element.id == meal.id);
      } else {
        this.favorites.add(meal);
      }
    });
  }

  _setFilters(Map<String, bool> filtersData) {
    setState(() {
      this._appliedFilters = filtersData;
      this.availableMeals = DUMMY_MEALS.where((meal) {
        return (_shouldBeGlutenFree(meal) &&
            _shouldBeLactoseFree(meal) &&
            _shouldBeVegan(meal) &&
            _shouldBeVegetarian(meal));
      }).toList();
    });
  }

  bool _shouldBeGlutenFree(Meal meal) {
    if (_appliedFilters['gluten'] && !meal.isGlutenFree) {
      return false;
    }
    return true;
  }

  bool _shouldBeLactoseFree(Meal meal) {
    if (_appliedFilters['lactose'] && !meal.isLactoseFree) {
      return false;
    }
    return true;
  }

  bool _shouldBeVegan(Meal meal) {
    if (_appliedFilters['vegan'] && !meal.isVegan) {
      return false;
    }
    return true;
  }

  bool _shouldBeVegetarian(Meal meal) {
    if (_appliedFilters['vegetarian'] && !meal.isVegetarian) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.pinkAccent,
        canvasColor: Color.fromRGBO(250, 250, 250, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(21, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(21, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabsScreen(this.favorites),
      routes: {
        MealsList.ROUTE: (_) => MealsList(this.availableMeals),
        MealDetails.ROUTE: (_) =>
            MealDetails(this.favorites, this._toggleFavorite),
        FiltersScreen.ROUTE: (_) =>
            FiltersScreen(_setFilters, this._appliedFilters),
      },
    );
  }
}
