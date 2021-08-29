import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final int id;
  final String name;

  ItemCard({this.id, this.name});

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
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
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
        onTap: () {},
      ),
    );
  }
}
