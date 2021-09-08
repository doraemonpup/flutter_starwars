import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/background.dart';
import './category_items_screen.dart';

class ItemDetailScreen extends StatefulWidget {
  static const routeName = '/item-detail';

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  var data, routeArgs;

  @override
  void didChangeDependencies() {
    routeArgs = ModalRoute.of(context).settings.arguments;
    fetchData(routeArgs['category'], routeArgs['id'] + 1).then((val) {
      setState(() {
        data = val;
      });
    });
    super.didChangeDependencies();
  }

  fetchData(String category, int id) async {
    final url = Uri.parse('https://swapi.dev/api/$category/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      return data;
    } else if (response.statusCode == 404) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Not found!'),
              actions: [
                TextButton(
                  child: Text('Ok'),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    var keyList = [];
    var valueList = [];
    if (data != null) {
      data.forEach((key, value) => keyList.add(key));
      data.forEach((key, value) => valueList.add(value));
    }

    return Background(
      child: data == null
          ? Center(child: CircularProgressIndicator())
          : Align(
              // height: double.infinity,
              // width: double.infinity,
              // alignment: Alignment.center,
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (ctx, i) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            keyList[i],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: Text(
                            valueList[i],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
