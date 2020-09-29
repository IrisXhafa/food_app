import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _buildListTile(IconData icon, String text, Function handler) {
      return ListTile(
        leading: Icon(icon),
        title: Text(text),
        onTap: handler,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 100,
          ),
          _buildListTile(
            Icons.category,
            'Categories',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          _buildListTile(Icons.filter_list, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.ROUTE);
          })
        ],
      ),
    );
  }
}
