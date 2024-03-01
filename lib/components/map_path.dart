import 'package:flutter/material.dart';
import 'package:history_walk/components/percentage_path.dart';

import 'lotr/lotr_path.dart';

class MapPathWidget extends StatelessWidget {
  Size size;

  MapPathWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(40.0),
        minScale: 0.1,
        maxScale: 4.0,
        child: Container(
            child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(image: AssetImage('assets/routes/lotr/map.png')),
            Positioned(
                left: -35, top: -22, child: percentagePath(getLotrPath(size), size, percentage: 1))
          ],
        )));
  }
}
