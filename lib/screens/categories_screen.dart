import 'package:flutter/material.dart';

import '../widgets/background.dart';
import '../widgets/header.dart';
import '../widgets/category_item.dart';

const CATEGORIES = const [
  'people',
  'planets',
  'species',
  'vehicles',
  'starships',
];

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        children: [
          Header('Categories'),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.all(25),
              children: CATEGORIES
                  .map(
                    (catData) => CategoryItem(
                      category: catData,
                    ),
                  )
                  .toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
