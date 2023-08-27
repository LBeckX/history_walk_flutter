import 'package:flutter/material.dart';

import '../components/category_list.dart';
import '../components/route_list.dart';
import '../components/search_field.dart';
import '../layout/main_layout.dart';
import '../models/categorie_model.dart';
import '../models/route_model.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List<RouteModel> routesFiltered = RouteModel.getRoutes();
  final List<CategoryModel> categoriesAll = CategoryModel.getCategories();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return mainLayout(children: [
      SearchField(onSearch: (query) {
        onSearch(query);
      }),
      const SizedBox(height: 40),
      CategoryList(
          categories: categoriesAll,
          categoryClicked: (category) => onCategoryFilter(category)),
      const SizedBox(height: 20),
      RouteList(routes: routesFiltered)
    ]);
  }

  void onSearch(String query) {
    final suggestionRoutes = RouteModel.getRoutes().where((element) {
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
    final suggestionRoutes = RouteModel.getRoutes().where((element) {
      if (routesFiltered.length != RouteModel.getRoutes().length) {
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
