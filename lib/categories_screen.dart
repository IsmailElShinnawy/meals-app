import 'package:flutter/material.dart';

import './category_item.dart';
import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // returns a grid with all the categories
    // for the GridView we could also use the GridView.builder
    // for performance or for not knowing the # of items
    return Scaffold(
      appBar: AppBar(title: const Text('Meals App')),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((cat) => CategoryItem(
                  cat.id,
                  cat.title,
                  cat.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // width of column
          childAspectRatio: 3 / 2, // aspect ratio for with 200 width 300 height
          crossAxisSpacing: 20, // horizontal spacing
          mainAxisSpacing: 20, // vertical spacing
        ),
      ),
    );
  }
}
