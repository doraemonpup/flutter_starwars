import 'package:flutter/material.dart';

import '../screens/category_items_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String link;

  CategoryItem({
    this.title,
    this.link,
  });

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryItemsScreen.routeName, arguments: {
      'title': title,
      'link': link,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.1),
              Colors.black.withOpacity(0.5),
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
