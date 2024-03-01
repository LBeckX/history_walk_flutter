import 'package:flutter/material.dart';

import '../pages/route_detail_page.dart';

class RouteModel {
  String name;
  String description;
  String categories;
  String icon;
  String map;
  String path;
  Color color;
  Color bgColor;
  RouteDetailPage Function(RouteModel) detailPage;
  Map<String, int> distance;
  bool isSelected;

  RouteModel({
    required this.name,
    required this.description,
    required this.categories,
    required this.icon,
    required this.map,
    required this.path,
    required this.color,
    required this.bgColor,
    required this.detailPage,
    required this.distance,
    this.isSelected = false,
  });

  static List<RouteModel> getRoutes() => [
        RouteModel(
            name: 'Lord of the rings',
            description:
                'Go the distance from the Shire to Mordor and throw the ring into the flames - 1.800 miles or 2.700 km',
            categories: 'movie, book, audio',
            icon: 'assets/routes/lotr/icon.svg',
            map: 'assets/routes/lotr/map.svg',
            path: 'assets/routes/lotr/path.svg',
            distance: {'miles': 1800, 'km': 2700},
            color: Colors.white,
            bgColor: Colors.black,
            detailPage: (routeModel) => RouteDetailPage(routeModel: routeModel),
            isSelected: false),
        /*RouteModel(
            name: 'Forest gump',
            description:
                'Forest gump ran 15.248 miles or 24.539 km. Crossed the United States five times in the process before deciding to go home.',
            icon: 'assets/routes/forrestgump_icon.svg',
            map: 'assets/routes/forrestgump_icon.svg',
            categories: 'movie',
            color: Colors.white,
            bgColor: Colors.black,
            isSelected: false),
        RouteModel(
            name: 'Around the world in 80 days',
            description:
                'Around the world in 80 days? Absolute mastery! - 40.000 km',
            icon: 'assets/routes/around_the_world_in_80_days.svg',
            map: 'assets/routes/around_the_world_in_80_days.svg',
            categories: 'movie, book, audio',
            color: Colors.white,
            bgColor: Colors.black,
            isSelected: false),
        RouteModel(
            name: 'Harry Potter',
            description: 'Once around the castle - 53,66 km',
            icon: 'assets/routes/harry_potter_logo.svg',
            map: 'assets/routes/harry_potter_logo.svg',
            categories: 'movie, book, audio',
            color: Colors.white,
            bgColor: Colors.black,
            isSelected: false)*/
      ];
}
