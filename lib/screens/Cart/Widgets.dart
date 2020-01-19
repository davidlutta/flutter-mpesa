import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mpesa/bloc/CartListBloc.dart';
import 'package:flutter_mpesa/model/FoodItem.dart';

class CartBody extends StatelessWidget {
  final List<FoodItem> foodItems;

  CartBody(this.foodItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(35, 10, 25, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          title(),
          Expanded(
            flex: 1,
            child: foodItems.length > 0 ? foodItemsList() : noItemContainer(),
          )
        ],
      ),
    );
  }

  ListView foodItemsList() {
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (builder, index) {
        return CartListItem(foodItem: foodItems[index]);
      },
    );
  }

  Container noItemContainer() {
    return Container(
      child: Center(
        child: Text(
          "No more items left in the cart",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[50],
              fontSize: 20),
        ),
      ),
    );
  }
}

Widget title() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 35),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "My",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
            ),
            Text(
              "Order",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 35),
            )
          ],
        )
      ],
    ),
  );
}

class CartListItem extends StatelessWidget {
  final FoodItem foodItem;

  CartListItem({this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: ItemContent(foodItem),
    );
  }
}

class ItemContent extends StatelessWidget {
  final FoodItem foodItem;

  ItemContent(this.foodItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              foodItem.imageUrl,
              fit: BoxFit.cover,
              height: 55,
              width: 80,
            ),
          ),
          RichText(
            text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(text: foodItem.quantity.toString()),
                  TextSpan(text: " x "),
                  TextSpan(text: foodItem.title)
                ]),
          ),
          Text(
            "\ KES ${foodItem.quantity * foodItem.price}",
            style:
                TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
          child: GestureDetector(
            child: Icon(
              CupertinoIcons.back,
              size: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Icon(
              CupertinoIcons.delete,
              size: 35,
            ),
          ),
          onTap: () {},
        )
      ],
    );
  }
}

class BottomBar extends StatelessWidget {
  final List<FoodItem> foodItems;

  BottomBar(this.foodItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35, bottom: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          totalAmount(foodItems),
          Divider(
            height: 1,
            color: Colors.grey[700],
          ),
          SizedBox(
            height: 10,
          ),
          nextButtonBar(),
        ],
      ),
    );
  }

  Container nextButtonBar() {
    return Container(
      margin: EdgeInsets.only(right: 25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Color(0xff24feb3), borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
          "Checkout",
          style: TextStyle(
              fontWeight: FontWeight.w700, color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }

  Container totalAmount(List<FoodItem> foodItem) {
    return Container(
      margin: EdgeInsets.only(
        right: 10,
      ),
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Total",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
          ),
          Text(
            "\ KES ${returnTotalAmount(foodItems)}",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
          ),
        ],
      ),
    );
  }

  String returnTotalAmount(List<FoodItem> foodItems) {
    double totalAmount = 0.0;
    for (int i = 0; i < foodItems.length; i++) {
      totalAmount = totalAmount + foodItems[i].price * foodItems[i].quantity;
    }
    return totalAmount.toStringAsFixed(2);
  }
}

class CustomPersonWidget extends StatefulWidget {
  @override
  _CustomPersonWidgetState createState() => _CustomPersonWidgetState();
}

class _CustomPersonWidgetState extends State<CustomPersonWidget> {
  int _noOfPersons = 1;
  double _buttonWidth = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300], width: 2),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 5),
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: _buttonWidth,
            height: _buttonWidth,
            child: FlatButton(
              child: Text(
                "-",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  if (_noOfPersons > 1) {
                    _noOfPersons--;
                  }
                });
              },
            ),
          ),
          Text(
            _noOfPersons.toString(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          SizedBox(
            width: _buttonWidth,
            height: _buttonWidth,
            child: FlatButton(
              child: Text(
                "+",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  if (_noOfPersons > 1) {
                    _noOfPersons++;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
