import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.55), BlendMode.dstATop),
          ),
        ),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
