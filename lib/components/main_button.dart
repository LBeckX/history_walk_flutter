import 'package:flutter/material.dart';

typedef Callback = Function(BuildContext context);

class MainButton extends StatelessWidget {
  final Callback onTab;

  const MainButton({super.key, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTab(context);
      },
      child: Container(
          height: 45,
          width: 130,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff9dceff), Color(0xff92a3fd)]),
              borderRadius: BorderRadius.circular(100)),
          child: const Center(
            child: Text(
              'Start',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          )),
    );
  }
}
