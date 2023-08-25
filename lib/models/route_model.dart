import 'package:flutter/material.dart';

class RouteModel {
  String name;
  String description;
  String categories;
  String icon;
  Color color;
  Color bgColor;
  bool isSelected;

  RouteModel({
    required this.name,
    required this.description,
    required this.categories,
    required this.icon,
    required this.color,
    required this.bgColor,
    this.isSelected = false,
  });

  static List<RouteModel> getRoutes() => [
    RouteModel(
        name: 'Lord of the rings',
        description:
            'Go the distance from the Shire to Mordor and throw the ring into the flames - 454 km',
        categories: 'movie, book, audio',
        icon: 'assets/routes/lotr_icon.svg',
        color: Colors.white,
        bgColor: Colors.black,
        isSelected: false),
    RouteModel(
        name: 'Forest gump',
        description:
            'Forest gump ran 24.539 km or 15248 miles. Crossed the United States five times in the process before deciding to go home.',
        icon: 'assets/routes/forrestgump_icon.svg',
        categories: 'movie',
        color: Colors.white,
        bgColor: Colors.black,
        isSelected: false),
    RouteModel(
        name: 'Around the world in 80 days',
        description:
            'Around the world in 80 days? Absolute mastery! - 40.000 km',
        icon: 'assets/routes/around_the_world_in_80_days.svg',
        categories: 'movie, book, audio',
        color: Colors.white,
        bgColor: Colors.black,
        isSelected: false),
    RouteModel(
        name: 'Harry Potter',
        description: 'Once around the castle - 53,66 km',
        icon: 'assets/routes/harry_potter_logo.svg',
        categories: 'movie, book, audio',
        color: Colors.white,
        bgColor: Colors.black,
        isSelected: false)
  ];
}
