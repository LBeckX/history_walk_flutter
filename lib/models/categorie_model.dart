import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String category;
  IconData? icon;
  Color? fontColor;
  Color? boxColor;

  CategoryModel(
      {required this.name,
      required this.category,
      this.icon,
      this.boxColor = Colors.white,
      this.fontColor = Colors.black});
}

List<CategoryModel> categories = [
  CategoryModel(
      name: 'Movies',
      category: 'movie',
      icon: Icons.movie,
      boxColor: Colors.white,
      fontColor: Colors.black),
  CategoryModel(
      name: 'Books',
      category: 'book',
      icon: Icons.book,
      boxColor: Colors.white,
      fontColor: Colors.black),
  CategoryModel(
      name: 'Audio',
      category: 'audio',
      icon: Icons.audio_file,
      boxColor: Colors.white,
      fontColor: Colors.black),
];
