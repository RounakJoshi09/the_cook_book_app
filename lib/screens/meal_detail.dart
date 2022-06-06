import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

Widget getHeading(String title, BuildContext context) {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Text(title, style: Theme.of(context).textTheme.titleSmall));
}

Widget buildContainer({Widget child}) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      height: 200,
      width: 300,
      //  color: Theme.of(context).canvasColor,
      child: child);
}

Widget buildContainerSteps({Widget child}) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      height: 500,
      width: 300,
      //  color: Theme.of(context).canvasColor,
      child: child);
}

class MealDetail extends StatelessWidget {
  static const routeName = "/meal-detail";
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(title: Text(meal.title)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              getHeading("Ingredients", context),
              buildContainer(
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              meal.ingredients[index],
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                        );
                      },
                      itemCount: meal.ingredients.length)),
              getHeading('Steps', context),
              buildContainerSteps(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                          maxRadius: 15,
                        ),
                        title: Text(
                          meal.steps[index],
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: meal.steps.length,
              ))
            ],
          ),
        ));
  }
}
