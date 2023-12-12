import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  late List<Widget> screens;
  @override
  void initState() {
    super.initState();
    initializeScreens(context);
  }

  void initializeScreens(BuildContext context) {
    screens = [
      Container(
        color: Colors.green,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.pink,
      ),
      Container(
        color: Colors.purple,
      )
    ];
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text('Yawo Yawo'),
        actions: [
          CircleAvatar(
            radius: 32,
            backgroundImage: ,
          )
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: onTabTapped,
          selectedItemColor: Colors.amber[200]
          
          
          items: [],)
      )
    );
  }
}
