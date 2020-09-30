import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const ROUTE = '/filters';

  final Function _setFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this._setFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isVegan = false;

  bool _isVegetarian = false;

  bool _isGlutenFree = false;

  bool _isLactoseFree = false;

  @override
  initState() {
    this._isVegan = widget.currentFilters['vegan'];
    this._isVegetarian = widget.currentFilters['vegetarian'];
    this._isGlutenFree = widget.currentFilters['gluten'];
    this._isLactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  _createSwitch(
      {bool value, String desc, String text, IconData icon, Function handler}) {
    return SwitchListTile(
        title: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(desc),
        secondary: Icon(icon),
        value: value,
        onChanged: handler);
  }

  _handleVeganSwitch(bool val) {
    setState(() {
      this._isVegan = val;
    });
  }

  _handleVegetarianSwitch(bool val) {
    setState(() {
      this._isVegetarian = val;
    });
  }

  _handleLactoseSwitch(bool val) {
    setState(() {
      this._isLactoseFree = val;
    });
  }

  _handleGlutenSwitch(bool val) {
    setState(() {
      this._isGlutenFree = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Map<String, bool> savedFilters = {
                'gluten': this._isGlutenFree,
                'lactose': this._isLactoseFree,
                'vegan': this._isVegan,
                'vegetarian': this._isVegetarian,
              };
              widget._setFilters(savedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Adjust your meals selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            _createSwitch(
              text: 'Vegan',
              icon: Icons.nature,
              value: _isVegan,
              handler: _handleVeganSwitch,
              desc: 'Only include vegan meals',
            ),
            _createSwitch(
              text: 'Vegetarian',
              icon: Icons.nature,
              value: _isVegetarian,
              handler: _handleVegetarianSwitch,
              desc: 'Only include vegetarian meals',
            ),
            _createSwitch(
              text: 'Lactose Free',
              icon: Icons.nature,
              value: _isLactoseFree,
              handler: _handleLactoseSwitch,
              desc: 'Only include Lactose-free meals',
            ),
            _createSwitch(
              text: 'Gluten Free',
              icon: Icons.nature,
              value: _isGlutenFree,
              handler: _handleGlutenSwitch,
              desc: 'Only include Gluten-free meals',
            ),
          ],
        ),
      ),
    );
  }
}
