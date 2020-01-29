import 'package:flutter/material.dart';
import 'package:flutter_mpesa/model/FoodItem.dart';

import 'Widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            UpperSection(),
            SizedBox(
              height: 5,
            ),
            for (var foodItem in foodItemList.foodItems)
              ItemContainer(foodItem: foodItem)
          ],
        ),
      ),
    );
  }
}

class UpperSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(35, 25, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(
            height: 10,
          ),
          title(),
          SizedBox(
            height: 10,
          ),
          searchBar(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}


