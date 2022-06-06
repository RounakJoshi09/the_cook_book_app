import 'package:flutter/material.dart';

import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/meal_detail.dart';
import 'screens/tab_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Cook Book',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodySmall: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyMedium: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleSmall: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TabScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetail.routeName: (ctx) => MealDetail(),
      },
      //On Generate Route is used when we dont defined route and tap ,which generate a route and this route function is called.
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: ((context) => CategoriesScreen()));
      // },
      //Unknown routre is 404 page on web ,when ni routre is exist then this route ois generated.
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: ((context) => CategoryMealsScreen()));
      // },
    );
  }
}
