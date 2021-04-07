// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_application/components/app_bar.dart';
import 'package:travel_application/components/drawer.dart';
import 'package:travel_application/screen/homeScreen.dart';
import 'package:travel_application/screen/bookmark.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOption = <Widget>[
    // Center(
    //   child: Text("home"),
    // ),
    HomeScreen(),
    Bookmark(),
    Center(child: Text("Blogs")),
    Center(child: Text("Map")),
    Center(child: Text("User")),
  ];

  void _setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: drawer(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOption,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidBookmark),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bloggerB),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.mapMarkerAlt),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userAlt),
            label: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _setIndex,
        unselectedFontSize: 0.0,
        selectedFontSize: 0.0,
        selectedItemColor: Color(0xff007580),
        unselectedItemColor: Colors.grey[400],
        backgroundColor: Color(0xffffffff),
        elevation: 0.0,
        iconSize: 25.0,
      ),
    );
  }
}