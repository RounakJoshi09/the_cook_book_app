import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import '../models/meal.dart';

class Meal extends StatelessWidget {
  final String title;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  Meal(
      {@required this.title,
      @required this.imageURL,
      @required this.affordability,
      @required this.complexity,
      @required this.duration});

  @override
  void selected_meal() {}
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selected_meal,
      borderRadius: BorderRadius.circular(25),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imageURL,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
