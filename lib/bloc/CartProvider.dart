import 'package:flutter_mpesa/model/FoodItem.dart';

class CartProvider {
  List<FoodItem> foodItems = [];

  List<FoodItem> addToList(FoodItem foodItem) {
    bool isPresent = false;
    if (foodItems.length > 0) {
      for (int i = 0; i < foodItems.length; i++) {
        if (foodItems[i].id == foodItem.id) {
          increasesItemQuantity(foodItem);
          isPresent = true;
          break;
        } else {
          isPresent = false;
        }
      }
      if (!isPresent) {
        foodItems.add(foodItem);
      }
    } else {
      foodItems.add(foodItem);
    }
    return foodItems;
  }

  List<FoodItem> removeFromList(FoodItem foodItem) {
    foodItems.remove(foodItem);
    return foodItems;
  }

  void increasesItemQuantity(FoodItem foodItem) => foodItem.incrementQuantity();

  void decreaseItemQuantity(FoodItem foodItem) => foodItem.decrementQuantity();
}
