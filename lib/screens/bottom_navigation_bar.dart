import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favourite_screen.dart';

class BotttomNavigation_Bar extends StatefulWidget {
  @override
  State<BotttomNavigation_Bar> createState() => _BotttomNavigation_BarState();
}

class _BotttomNavigation_BarState extends State<BotttomNavigation_Bar> {
  @override
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouriteScreen(), 'title': 'Favourite'},
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  int _selectedPageIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: _selectedPageIndex == 0
              ? Text('The Cook Book')
              : Text(_pages[_selectedPageIndex]['title'])),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_sharp),
              label: 'Categories',
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
              backgroundColor: Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}
