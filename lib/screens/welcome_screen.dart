import 'package:flutter/material.dart';

import '../widgets/background.dart';
import './categories_screen.dart';

class WelcomeScreen extends StatelessWidget {
  // static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'SWAPI',
                    style: TextStyle(
                      fontSize: 48,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                Text(
                  'Welcome to the dark side',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  // border color
                  color: Theme.of(context).primaryColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20,
                ),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CategoryScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
