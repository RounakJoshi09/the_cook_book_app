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

  String get complexityText {
    switch (complexity) {
      case (Complexity.Simple):
        return 'Simple';
      case (Complexity.Challenging):
        return 'Challenging';
      case (Complexity.Hard):
        return 'Hard';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case (Affordability.Pricey):
        return 'Pricey';
      case (Affordability.Luxurious):
        return 'Luxurious';
      case (Affordability.Affordable):
        return 'Affordable';
    }
  }

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
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      width: 300,
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text(complexityText),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.currency_bitcoin),
                        SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityText),
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
