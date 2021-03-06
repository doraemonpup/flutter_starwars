import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../widgets/background.dart';
import '../widgets/header.dart';
import '../widgets/category_item_card.dart';

class CategoryItemsScreen extends StatefulWidget {
  @override
  _CategoryItemsScreenState createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends State<CategoryItemsScreen> {
  var data, category;

  @override
  void didChangeDependencies() {
    category = Get.arguments['category'];
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
          : Column(
              children: [
                Header('$category Items'),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (ctx, i) => CategoryItemCard(
                      id: i,
                      name: data[i]['name'],
                      category: category,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
