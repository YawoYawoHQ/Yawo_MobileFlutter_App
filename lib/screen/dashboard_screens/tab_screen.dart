import 'package:flutter/material.dart';

import '../../util/constants/colors.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/dashboard-tab';
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgNeutralColor,
      body: Center(
        child: Text("Tab Screen"),
      ),
    );
  }

}
