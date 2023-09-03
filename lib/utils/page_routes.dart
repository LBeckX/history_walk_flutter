import 'package:flutter/material.dart';
import 'package:history_walk/models/route_model.dart';
import 'package:history_walk/pages/route_detail_page.dart';

import '../pages/profile_page.dart';
import '../pages/start_page.dart';

MaterialPageRoute Function() startPage =
    () => MaterialPageRoute(builder: (context) => const StartPage());

MaterialPageRoute Function(RouteModel routeModel) detailPage =
    (RouteModel routeModel) => MaterialPageRoute(
        builder: (context) => RouteDetailPage(routeModel: routeModel));

MaterialPageRoute Function() profilePage =
    () => MaterialPageRoute(builder: (context) => const ProfilePage());
