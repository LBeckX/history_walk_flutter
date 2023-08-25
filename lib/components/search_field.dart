import 'package:flutter/material.dart';

typedef SearchCallback = void Function(String query);

class SearchField extends StatelessWidget {
  final SearchCallback? onSearch;

  const SearchField({super.key, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1d1617).withOpacity(.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        onChanged: (text) {
          if (onSearch != null) {
            onSearch!(text);
          }
        },
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search',
            hintStyle: const TextStyle(color: Color(0xffdddada), fontSize: 16),
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.search),
            ),
            suffixIcon: const SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: .1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.tune),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
