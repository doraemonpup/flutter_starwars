import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/background.dart';

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
    }
  }

  @override
  Widget build(BuildContext context) {
    print('from build function ===> \n$data');
    return Background(
      child: Center(
        child: data == null
            ? CircularProgressIndicator()
            : Text('Data are loaded'),
      ),
    );
  }
}
