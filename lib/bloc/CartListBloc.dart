import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_mpesa/bloc/CartProvider.dart';
import 'package:flutter_mpesa/model/FoodItem.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {
  CartListBloc();

  CartProvider provider = CartProvider();

  var _listController = BehaviorSubject<List<FoodItem>>.seeded([]);

  // output
  Stream<List<FoodItem>> get listStream => _listController.stream;

  // input
  Sink<List<FoodItem>> get listSink => _listController.sink;

  addToList(FoodItem foodItem) {
    listSink.add(provider.addToList(foodItem));
  }

  removeFromList(FoodItem foodItem) {
    listSink.add(provider.removeFromList(foodItem));
  }

  clearList(){
   provider.clearList();
  }

  @override
  void dispose() {
    super.dispose();
    _listController.close();
  }
}
