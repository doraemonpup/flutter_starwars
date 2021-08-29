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
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Welcome to the dark side',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
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
