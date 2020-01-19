import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mpesa/bloc/CartListBloc.dart';
import 'package:flutter_mpesa/model/FoodItem.dart';

import 'Widgets.dart';

class Cart extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    List<FoodItem> foodItems;
    return StreamBuilder<List<FoodItem>>(
        stream: bloc.listStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<FoodItem>> snapshot) {
          if (snapshot.data != null) {
            foodItems = snapshot.data;
            return Scaffold(
              body: SafeArea(
                child: Container(
                  child: CartBody(foodItems),
                ),
              ),
              bottomNavigationBar: BottomBar(foodItems),
            );
          } else {
            return Container();
          }
        });
  }
}
