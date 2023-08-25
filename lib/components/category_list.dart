import 'package:flutter/material.dart';
import 'package:history_walk/models/categorie_model.dart';

typedef CategoryCallback = void Function(CategoryModel category);

class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;
  final CategoryCallback? categoryClicked;

  const CategoryList(
      {super.key, required this.categories, this.categoryClicked});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 160,
          child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(20),
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (categoryClicked != null) {
                      categoryClicked!(categories[index]);
                    }
                  },
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xff1d1617).withOpacity(.15),
                              blurRadius: 20,
                              spreadRadius: 0.0)
                        ],
                        borderRadius: BorderRadius.circular(16),
                        color: categories[index].boxColor),
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
                              child: Icon(
                                categories[index].icon,
                                color: Colors.grey,
                              )),
                        ),
                        Text(
                          categories[index].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: categories[index].fontColor),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
