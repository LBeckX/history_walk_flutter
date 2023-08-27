import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:history_walk/models/route_model.dart';
import 'package:history_walk/pages/route_detail_page.dart';

class RouteList extends StatelessWidget {
  List<RouteModel> routes;

  RouteList({super.key, required this.routes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'Routes',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 350,
          child: ListView.separated(
              itemCount: routes.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(20),
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xff1d1617).withOpacity(.15),
                            blurRadius: 20,
                            spreadRadius: 0.0)
                      ],
                      borderRadius: BorderRadius.circular(16),
                      color: routes[index].bgColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: SvgPicture.asset(routes[index].icon)),
                      ),
                      Text(
                        routes[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: routes[index].color),
                      ),
                      Text(
                        routes[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: routes[index].color.withOpacity(.8)),
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: !routes[index].isSelected
                                    ? [Color(0xff9dceff), Color(0xff92a3fd)]
                                    : [Colors.transparent, Colors.transparent]),
                            borderRadius: BorderRadius.circular(100)),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => RouteDetailPage(
                                      routeModel: routes[index]),
                                ),
                              );
                            },
                            child: Center(
                              child: Text(
                                'Start',
                                style: TextStyle(
                                    color: !routes[index].isSelected
                                        ? Colors.white
                                        : const Color(0xff9dceff),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
