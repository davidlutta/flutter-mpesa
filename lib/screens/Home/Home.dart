import 'package:flutter/material.dart';
import 'package:flutter_mpesa/model/FoodItem.dart';

import 'Widgets.dart';

class Home extends StatelessWidget {
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
          categories()
        ],
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {
  final FoodItem foodItem;

  ItemContainer({this.foodItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Items(
        hotel: foodItem.hotel,
        itemName: foodItem.title,
        itemPrice: foodItem.price,
        leftAligned: foodItem.id % 2 == 0 ? true : false,
        imageUrl: foodItem.imageUrl,
      ),
    );
  }
}
