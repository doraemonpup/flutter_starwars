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
    fetchPeople(routeArgs['title']).then((val) {
      setState(() {
        data = val;
      });
    });
    super.didChangeDependencies();
  }

  fetchPeople(String category) async {
    final url = Uri.parse('https://swapi.dev/api/$category/');
    print(url);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      data = json.decode(response.body)['results'];
      return data;
    }
  }

  Widget build(BuildContext context) {
    // return Background(
    //   child: FutureBuilder(
    //     future: fetchPeople(),
    //     builder: (ctx, snapshot) {
    //       print(snapshot);
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       } else {
    //         if (snapshot.hasError) {
    //           return Center(
    //             child: Text('An error occured: ${snapshot.error}'),
    //           );
    //         } else {
    //           print(snapshot);
    //           return ListView.builder(
    //             // itemCount: snapshot.data.length,
    //             itemBuilder: (ctx, i) => ListTile(
    //               leading: CircleAvatar(
    //                 backgroundColor: Colors.white30,
    //                 child: Text(
    //                   snapshot.data[i]['gender'] == 'male' ? 'M' : 'F',
    //                   style: TextStyle(
    //                     color: Theme.of(context).primaryColor,
    //                   ),
    //                 ),
    //               ),
    //               title: Text(
    //                 snapshot.data[i]['name'],
    //                 style: TextStyle(
    //                   color: Theme.of(context).primaryColor,
    //                 ),
    //               ),
    //             ),
    //           );
    //         }
    //       }
    //     },
    //   ),
    // );
    return Background(
      child: data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (ctx, i) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor.withAlpha(112),
                  child: Text(
                    data[i]['gender'] == 'male' ? 'M' : 'F',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                title: Text(
                  data[i]['name'] != null ? data[i]['name'] : 'No Data Found',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text(
                  'Birth Year: ${data[i]['birth_year']}',
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                onTap: () {},
              ),
            ),
    );
  }
}
