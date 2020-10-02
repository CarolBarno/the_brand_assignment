import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:thebrandassignment/model/constants.dart';
import 'package:thebrandassignment/view/home.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    Text(''),
    Home(),
    Text(''),
    Text(''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,

        unselectedItemColor: Colors.grey[600],

        selectedItemColor: teal,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('MarketPlace'),
          ),
          BottomNavigationBarItem(
            icon: Icon(AntIcons.fund_outline),
            title: Text(
              'My Designs',
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(AntIcons.unordered_list), title: Text('Category 3')),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user), title: Text('Category 4')),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
