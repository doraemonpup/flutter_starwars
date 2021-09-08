import 'package:flutter/material.dart';

import '../screens/category_items_screen.dart';

class CategoryItem extends StatelessWidget {
  final String category;

  CategoryItem({
    this.category,
  });

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryItemsScreen.routeName, arguments: {
      'category': category,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.toUpperCase(),
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.4),
              Colors.white.withOpacity(0.3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onTap: () => _selectCategory(context),
    );
  }
}
