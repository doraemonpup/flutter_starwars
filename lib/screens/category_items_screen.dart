import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/background.dart';

class CategoryItemsScreen extends StatefulWidget {
  static const routeName = '/category-items';

  @override
  _CategoryItemsScreenState createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends State<CategoryItemsScreen> {
  var data, routeArgs, category;

  @override
  void didChangeDependencies() {
    routeArgs = ModalRoute.of(context).settings.arguments;
    category = routeArgs['category'];
    fetchData(category).then((val) {
      setState(() {
        data = val;
      });
    });
    super.didChangeDependencies();
  }

  fetchData(String category) async {
    final url = Uri.parse('https://swapi.dev/api/$category/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      data = json.decode(response.body)['results'];
      return data;
    }
  }

  Widget build(BuildContext context) {
    return Background(
      child: data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (ctx, i) => Card(
                // elevation: 0,
                color: Colors.transparent,
                shadowColor: Colors.white10,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).primaryColor.withAlpha(72),
                    child: Text(
                      (i + 1).toString(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  title: Text(
                    data[i]['name'],
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
              ),
            ),
    );
  }
}
