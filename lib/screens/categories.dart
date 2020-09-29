import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/screens/meals_list.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: [
          ...DUMMY_CATEGORIES.map((category) {
            return InkWell(
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.of(context).pushNamed(
                  MealsList.ROUTE,
                  arguments: {
                    'category': category,
                  },
                );
              },
              child: CategoryItem(category),
            );
          })
        ],
      ),
    );
  }
}
