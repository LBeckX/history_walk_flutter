import 'package:flutter/material.dart';
import 'package:history_walk/components/main_app_bar.dart';

import '../components/category_list.dart';
import '../components/route_list.dart';
import '../components/search_field.dart';
import '../models/categorie_model.dart';
import '../models/route_model.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List<RouteModel> routesFiltered = routes;
  final List<CategoryModel> categoriesAll = categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SearchField(onSearch: (query) {
            onSearch(query);
          }),
          const SizedBox(height: 40),
          CategoryList(
              categories: categoriesAll,
              categoryClicked: (category) => onCategoryFilter(category)),
          RouteList(routes: routesFiltered)
        ],
      ),
    );
  }

  void onSearch(String query) {
    final suggestionRoutes = routes.where((element) {
      final name = element.name.toLowerCase();
      final description = element.description.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input) || description.contains(input);
    }).toList();

    setState(() {
      routesFiltered = suggestionRoutes;
    });
  }

  void onCategoryFilter(CategoryModel category) {
    final suggestionRoutes = routes.where((element) {
      if (routesFiltered.length != routes.length) {
        return true;
      }

      final categoryList = element.categories.toLowerCase();
      final input = category.category.toLowerCase();
      return categoryList.contains(input);
    }).toList();

    setState(() {
      routesFiltered = suggestionRoutes;
    });
  }
}
