import 'package:flutter/material.dart';

import '../widgets/background.dart';
import './category_screen.dart';
import '../constants.dart';

class WelcomeScreen extends StatelessWidget {
  // static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Text(
                'Welcome to the dark side',
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding, horizontal: kDefaultPadding / 2),
            child: TextButton(
              child: Text(
                'Next',
                style: TextStyle(fontSize: 20),
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
