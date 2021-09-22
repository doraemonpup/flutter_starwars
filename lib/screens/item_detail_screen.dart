import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../widgets/background.dart';
import '../widgets/header.dart';
import '../widgets/detail_item.dart';

class ItemDetailScreen extends StatefulWidget {
  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  var data;

  @override
  void didChangeDependencies() {
    fetchData(Get.arguments['category'], Get.arguments['id'] + 1).then((data) {
      setState(() {
        data = data;
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
    var kList = [];
    var valList = [];
    if (data != null) {
      data.forEach((key, value) => kList.add(key));
      data.forEach((key, value) => valList.add(value));
    }

    return Background(
      child: data == null
          ? Center(child: CircularProgressIndicator())
          : Align(
              child: Column(
                children: [
                  Header(valList[0]),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (ctx, i) {
                        return DetailItem(
                          kList[i],
                          valList[i],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
