import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './screens/welcome_screen.dart';
import './screens/category_items_screen.dart';
import './screens/item_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static Map<int, Color> whiteColor = {
    50: Color.fromRGBO(252, 253, 253, .1),
    100: Color.fromRGBO(252, 253, 253, .2),
    200: Color.fromRGBO(252, 253, 253, .3),
    300: Color.fromRGBO(252, 253, 253, .4),
    400: Color.fromRGBO(252, 253, 253, .5),
    500: Color.fromRGBO(252, 253, 253, .6),
    600: Color.fromRGBO(252, 253, 253, .7),
    700: Color.fromRGBO(252, 253, 253, .8),
    800: Color.fromRGBO(252, 253, 253, .9),
    900: Color.fromRGBO(252, 253, 253, 1),
  };

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SWAPI',
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFFFCFDFD, whiteColor),
          accentColor: Colors.amberAccent,
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Color.fromRGBO(252, 253, 253, 1),
            ),
          ),
          fontFamily: 'Poppins',
        ),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => WelcomeScreen()),
          // GetPage(name: '/category', page: () => CategoryScreen()),
          GetPage(name: '/category-items', page: () => CategoryItemsScreen()),
          GetPage(name: '/item-detail', page: () => ItemDetailScreen()),
        ]);
  }
}
