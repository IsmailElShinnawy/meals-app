import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> chosenFilters;

  FiltersScreen(this.chosenFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree;
  bool _vegetarian;
  bool _vegan;
  bool _lactoseFree;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.chosenFilters['gluten'];
    _lactoseFree = widget.chosenFilters['lactose'];
    _vegetarian = widget.chosenFilters['vegetarian'];
    _vegan = widget.chosenFilters['vegan'];
  }

  Widget buildSwitchListTile(
      String title, String subtitle, bool value, Function onChangeHandler) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChangeHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(
            onPressed: () => widget.saveFilters({
              'gluten': _glutenFree,
              'vegetarian': _vegetarian,
              'lactose': _lactoseFree,
              'vegan': _vegan,
            }),
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meals selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Gluten-free',
                  'Only includes gluten-free meals',
                  _glutenFree,
                  (newVal) => setState(() => _glutenFree = newVal),
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'Only includes vegetarian meals',
                  _vegetarian,
                  (newVal) => setState(() => _vegetarian = newVal),
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Only includes vegan meals',
                  _vegan,
                  (newVal) => setState(() => _vegan = newVal),
                ),
                buildSwitchListTile(
                  'Lactose-Free',
                  'Only includes lactose-free meals',
                  _lactoseFree,
                  (newVal) => setState(() => _lactoseFree = newVal),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
