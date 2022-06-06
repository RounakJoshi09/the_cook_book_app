import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_widget.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final category_meal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Meal(
                title: category_meal[index].title,
                imageURL: category_meal[index].imageUrl,
                affordability: category_meal[index].affordability,
                complexity: category_meal[index].complexity,
                duration: category_meal[index].duration);
          },
          itemCount: category_meal.length,
        ));
  }
}
