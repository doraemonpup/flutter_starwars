import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/background.dart';
// import '../models/people.dart';

class CategoryItemsScreen extends StatefulWidget {
  static const routeName = '/category-items';

  @override
  _CategoryItemsScreenState createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends State<CategoryItemsScreen> {
  var data, routeArgs;

  @override
  void didChangeDependencies() {
    routeArgs = ModalRoute.of(context).settings.arguments;
    fetchData(routeArgs['category']).then((val) {
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
              itemBuilder: (ctx, i) => ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).primaryColor.withAlpha(112),
                  child: Text(
                    data[i]['gender'] == 'male' ? 'M' : 'F',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                title: Text(
                  data[i]['name'] != null ? data[i]['name'] : 'No Data Found',
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                subtitle: Text(
                  'Birth Year: ${data[i]['birth_year']}',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onTap: () {},
              ),
            ),
    );
  }
}
