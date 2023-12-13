import 'package:flutter/material.dart';
import 'package:mobile_app/screen/HomePage/homePage.dart';
import 'package:nb_utils/nb_utils.dart';

class BottomNavigation extends StatefulWidget {
  static const routeName = '/bottomNav';
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
      const HomePage(),
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
      ),
      Container(
        color: Colors.amber,
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
          elevation: 0,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          leadingWidth: 110,
          leading: const Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Center(
                child: Text('Yawo Yawo',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18))),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/Profiles.png'),
                ),
              ),
            ),
          ],
        ),
        body: screens[currentIndex],
        bottomNavigationBar: SizedBox(
            height: 60,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: onTabTapped,
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.black45,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.location_city), label: 'location'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.event_sharp), label: 'event'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: 'notifications'),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'chat'),
              ],
            )));
  }
}
