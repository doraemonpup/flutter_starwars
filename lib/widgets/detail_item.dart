import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  final String k;
  final String val;

  DetailItem(this.k, this.val);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              k,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Text(
              val,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
