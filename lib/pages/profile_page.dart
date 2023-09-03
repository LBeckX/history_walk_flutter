import 'package:flutter/material.dart';

import '../layout/main_layout.dart';

class ProfilePage extends StatefulWidget {
  static bool isActive = false;

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    ProfilePage.isActive = true;
  }

  @override
  void dispose() {
    super.dispose();
    ProfilePage.isActive = false;
  }

  @override
  void deactivate() {
    super.deactivate();
    ProfilePage.isActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return mainLayout(children: [
      Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Text(
            'Profile',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
          )),
      Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Text('',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
      )
    ]);
  }
}
