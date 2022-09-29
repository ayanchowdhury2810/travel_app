import 'package:flutter/material.dart';
import 'package:travel_app/pages/navPages/bar_item_page.dart';
import 'package:travel_app/pages/navPages/home_page.dart';
import 'package:travel_app/pages/navPages/my_page.dart';
import 'package:travel_app/pages/navPages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = const [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  int currInd = 0;

  void onTap(int index) {
    setState(() {
      currInd = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currInd],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currInd,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            label: ("Home"),
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            label: ("Bar"),
            icon: Icon(Icons.bar_chart_sharp),
          ),
          BottomNavigationBarItem(
            label: ("Search"),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: ("My"),
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
