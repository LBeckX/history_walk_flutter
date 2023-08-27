import 'package:flutter/material.dart';
import 'package:history_walk/models/categorie_model.dart';

typedef CategoryCallback = void Function(CategoryModel category);

class CategoryList extends StatefulWidget {
  final List<CategoryModel> categories;
  final CategoryCallback? categoryClicked;

  CategoryList({super.key, required this.categories, this.categoryClicked});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int? activeCategoryIndex;

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
              itemCount: widget.categories.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(20),
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              itemBuilder: (context, index) {
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (activeCategoryIndex != index) {
                          activeCategoryIndex = index;
                          return;
                        }
                        activeCategoryIndex = null;
                      });
                      if (widget.categoryClicked != null) {
                        widget.categoryClicked!(widget.categories[index]);
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
                          color: activeCategoryIndex == index
                              ? widget.categories[index].boxColor
                                  ?.withOpacity(.8)
                              : widget.categories[index].boxColor
                                  ?.withOpacity(.5)),
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
                                  widget.categories[index].icon,
                                  color: Colors.grey,
                                )),
                          ),
                          Text(
                            widget.categories[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: widget.categories[index].fontColor),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
