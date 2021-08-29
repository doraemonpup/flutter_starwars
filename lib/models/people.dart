import 'package:flutter/foundation.dart';

class People {
  final String name;
  final String gender;
  final String birthYear;

  People({
    @required this.name,
    @required this.gender,
    @required this.birthYear,
  });

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
        name: json['name'],
        gender: json['gender'],
        birthYear: json['birth_year']);
  }
}
