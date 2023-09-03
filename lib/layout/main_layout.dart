import 'package:flutter/material.dart';

import '../components/main_app_bar.dart';

Widget mainLayout({required List<Widget> children}) {
  return Scaffold(
    appBar: MainAppBar(),
    backgroundColor: Colors.white,
    body: ListView(
      children: children,
    ),
  );
}
