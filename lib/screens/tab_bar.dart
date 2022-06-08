import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/favourite_screen.dart';
import 'package:flutter_complete_guide/widgets/custom_drawer.dart';

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text('The Cook Book'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favourite',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavouriteScreen(),
          ],
        ),
      ),
    );
  }
}
