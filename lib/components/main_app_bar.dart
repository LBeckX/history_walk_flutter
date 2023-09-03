import 'package:flutter/material.dart';
import 'package:history_walk/components/hw_icon_button.dart';
import 'package:history_walk/pages/profile_page.dart';

import '../utils/page_routes.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('History Walk',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w900, fontSize: 18)),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: Container(
        child: (Navigator.canPop(context))
            ? GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const HwIconButton(icon: Icons.arrow_back_ios_sharp))
            : Container(),
      ),
      actions: [
        Container(
          child: !ProfilePage.isActive
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(profilePage());
                  },
                  child: const HwIconButton(icon: Icons.person))
              : Container(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
