import 'dart:developer';

import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('History Walk',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w900, fontSize: 18)),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {
          log('tab');
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xfff8f8f8),
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: const Icon(
            Icons.arrow_back_ios_sharp,
            size: 15,
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 37,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xfff8f8f8),
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: const Icon(
              Icons.more_horiz,
              size: 15,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
    ;
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
