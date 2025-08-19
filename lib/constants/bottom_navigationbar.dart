import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import '../screens/Homescreen/home_screen.dart';
import '../screens/prograss_ui/prograss_screen.dart';
import '../screens/setting_ui/setting_screen.dart';

class BottomNavigationbar extends StatefulWidget {
   BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  final  List<Widget>  _buildScreen =[
    HomeScreen(),
    PrograssScreen(),
    SettingScreen(),
  ];

  final PageController _pageController = PageController();

  int _selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _buildScreen,
        onPageChanged: (index){
          setState(() {
            _selectedIndex = index;
          });

        },
      ),
        bottomNavigationBar: BottomNavyBar(items: [
          BottomNavyBarItem(icon: Icon(Icons.home_outlined), title: Text("")),
          BottomNavyBarItem(icon: Icon(Icons.show_chart), title: Text("")),
          BottomNavyBarItem(icon: Icon(Icons.settings_rounded), title: Text("")),
        ], onItemSelected: (index){
          setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
          });

        }),
    );
  }
}


