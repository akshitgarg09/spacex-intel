import 'package:flutter/material.dart';

import 'upcoming_launches.dart';
import 'home_screen.dart';
import 'latest_launches.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  List<Widget> _pages = [HomeScreen(), LaunchScreen(), LatestLaunches()];

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.launch), label: 'Upcoming'),
          BottomNavigationBarItem(icon: Icon(Icons.new_label), label: 'Latest')
        ],
      ),
    );
  }
}
