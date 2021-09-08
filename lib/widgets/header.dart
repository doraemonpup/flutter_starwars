import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String headerText;

  Header(this.headerText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        headerText,
        style: TextStyle(
          fontSize: 32,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
