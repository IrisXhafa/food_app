import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTabIndex = 0;
  final List<Map<String, dynamic>> pages = [
    {'page': Categories(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Favorites'}
  ];

  _buildNavigationBarItem(String title, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(title),
    );
  }

  _changeSelectedPage(int index) {
    setState(() {
      this._selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedTabIndex]['title']),
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changeSelectedPage,
        items: [
          _buildNavigationBarItem('Categories', Icons.category),
          _buildNavigationBarItem('Favorites', Icons.favorite)
        ],
        currentIndex: _selectedTabIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
      ),
      body: pages[_selectedTabIndex]['page'],
    );
  }
}
