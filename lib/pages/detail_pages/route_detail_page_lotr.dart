import 'package:flutter/material.dart';

import '../../layout/main_layout.dart';
import '../route_detail_page.dart';

class RouteDetailPageLotr extends RouteDetailPage {
  RouteDetailPageLotr({super.key, required super.routeModel});

  @override
  State<RouteDetailPageLotr> createState() => _RouteDetailPageLotrState();
}

class _RouteDetailPageLotrState
    extends RouteDetailPageState<RouteDetailPageLotr> {
  @override
  Widget build(BuildContext context) {
    return mainLayout(children: [
      Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Text(
            widget.routeModel.name,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
          )),
      Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Text(widget.routeModel.description,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
      )
    ]);
  }
}