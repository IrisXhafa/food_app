import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals_app/widgets/categories.dart';
import 'package:meals_app/widgets/meals_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home: Categories(),
      routes: {MealsList.ROUTE: (_) => MealsList()},
    );
  }
}
