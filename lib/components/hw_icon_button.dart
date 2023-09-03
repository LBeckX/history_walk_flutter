import 'package:flutter/material.dart';

class HwIconButton extends StatelessWidget {
  final IconData icon;

  const HwIconButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xfff8f8f8),
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Icon(
        icon,
        size: 15,
        color: Colors.black,
      ),
    );
  }
}
