import 'package:flutter/material.dart';
import 'package:history_walk/pages/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'History Walk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: StartPage(),
      debugShowMaterialGrid: false,
    );
  }
}
