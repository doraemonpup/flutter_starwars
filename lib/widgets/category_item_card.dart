import 'package:flutter/material.dart';

import '../screens/item_detail_screen.dart';

class CategoryItemCard extends StatelessWidget {
  final int id;
  final String name;
  final String category;

  CategoryItemCard({
    this.id,
    this.name,
    @required this.category,
  });

  void _selectItem(BuildContext context) {
    Navigator.of(context).pushNamed(ItemDetailScreen.routeName, arguments: {
      'id': id,
      'category': category,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0,
      color: Colors.transparent,
      shadowColor: Colors.white10,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor.withAlpha(72),
          child: Text(
            (id + 1).toString(),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Theme.of(context).primaryColor,
        ),
        onTap: () => _selectItem(context),
      ),
    );
  }
}
