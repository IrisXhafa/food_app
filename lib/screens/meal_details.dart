import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetails extends StatelessWidget {
  static const String ROUTE = '/meal-details';

  _titleContainerBuilder(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Meal> appRoute =
        ModalRoute.of(context).settings.arguments;

    final Meal meal = appRoute['meal'];
    final appBar = AppBar(
      title: Text(meal.title),
    );

    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image(
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              _titleContainerBuilder(context, 'Ingredients'),
              Container(
                height: ((MediaQuery.of(context).size.height -
                        appBar.preferredSize.height) *
                    0.3),
                margin: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Card(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(meal.ingredients[index]),
                        ),
                        elevation: 6,
                      );
                    },
                    itemCount: meal.ingredients.length,
                  ),
                ),
              ),
              _titleContainerBuilder(context, 'Steps'),
              Container(
                height: 200,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(meal.steps[index]),
                    );
                  },
                  itemCount: meal.steps.length,
                ),
              )
            ],
          ),
        ));
  }
}
