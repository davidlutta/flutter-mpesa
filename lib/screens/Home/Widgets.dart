import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 30),
              child: Text(
                "0",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.teal[700],
                  borderRadius: BorderRadius.circular(50)),
            ),
          )
        ],
      ),
    );
  }
}

Widget title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(
        width: 45,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Salad",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          Text(
            "Delivery",
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 30),
          )
        ],
      )
    ],
  );
}

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Icon(
        Icons.search,
        color: Colors.black45,
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search...",
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            hintStyle: TextStyle(color: Colors.black87),
          ),
        ),
      )
    ],
  );
}

Widget categories() {
  return Container(
    height: 185,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Fresh Salads",
            availability: 12,
            selected: true),
        CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Frozen Salads",
            availability: 12,
            selected: false),
        CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Kenyan Salads",
            availability: 12,
            selected: false),
        CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "European Salads",
            availability: 12,
            selected: false),
        CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "American Salads",
            availability: 12,
            selected: false),
        CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Italian Salads",
            availability: 12,
            selected: false),
        CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Greek Salads",
            availability: 12,
            selected: false),
      ],
    ),
  );
}

class CategoryListItem extends StatelessWidget {
  final IconData categoryIcon;
  final String categoryName;
  final int availability;
  final bool selected;

  CategoryListItem(
      {@required this.categoryIcon,
      @required this.categoryName,
      @required this.availability,
      @required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: selected ? Color(0xff24fea1) : Colors.white,
          border: Border.all(
              color: selected ? Colors.transparent : Colors.grey[200],
              width: 1.5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[100],
                blurRadius: 15,
                offset: Offset(25, 0),
                spreadRadius: 5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: selected ? Colors.transparent : Colors.grey,
                    width: 1.5)),
            child: Icon(
              categoryIcon,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Text(
            categoryName,
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.black, fontSize: 15),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            availability.toString(),
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          )
        ],
      ),
    );
  }
}

class Items extends StatelessWidget {
  final bool leftAligned;
  final String imageUrl;
  final double itemPrice;
  final String hotel;
  final String itemName;

  Items(
      {@required this.leftAligned,
      @required this.imageUrl,
      @required this.itemPrice,
      @required this.hotel,
      @required this.itemName});

  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerBorderRadius = 10;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: leftAligned ? 0 : containerPadding,
              right: leftAligned ? containerPadding : 0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                      left: leftAligned
                          ? Radius.circular(0)
                          : Radius.circular(containerBorderRadius),
                      right: leftAligned
                          ? Radius.circular(containerBorderRadius)
                          : Radius.circular(0)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: leftAligned ? 20 : 0, right: leftAligned ? 0 : 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            itemName,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                        ),
                        Text(
                          "\$$itemPrice",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(text: "by"),
                              TextSpan(
                                  text: hotel,
                                  style: TextStyle(fontWeight: FontWeight.w700))
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
