import 'package:flutter/cupertino.dart';

FoodItemList foodItemList = FoodItemList(foodItems: [
  FoodItem(id: 1, title: "Tossed Salad", hotel: "SliceLime", price: 1.0, imageUrl: "https://www.weightwatchers.com/images/1033/dynamic/foodandrecipes/2016/02/TossedSaladWithClassicItalianDressing_MA16_EAT_FAMILY_D_800X800.jpg"),
  FoodItem(id: 2, title: "Caesar Salad", hotel: "Cauto'de cuisine", price: 1.0, imageUrl: "https://www.onceuponachef.com/images/2010/08/Homemade-Caesar-Salad-Dressing-760x887.jpg"),
  FoodItem(id: 3, title: "Chicken Salad", hotel: "Nandos", price: 1.0, imageUrl: "https://nutritiouslife.com/wp-content/uploads/2010/05/shutterstock_274855409-copy-1302x988.jpg"),
  FoodItem(id: 3, title: "Chilean Salad", hotel: "Caffe Chile", price: 1.0, imageUrl: "https://therecipe.website/wp-content/uploads/2017/06/Chilean-Salad-Ensalada-Chilena-1-600x338.jpg"),
  FoodItem(id: 4,
      title: "Cobb Salad",
      hotel: "Salad Bar",
      price: 1.0,
      imageUrl: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2013/3/4/2/FNM_040113-Classic-Cobb-Salad-Recipe_s4x3.jpg.rend.hgtvcom.616.462.suffix/1371614158612.jpeg"),
  FoodItem(id: 5,
      title: "Coleslaw",
      hotel: "KFC",
      price: 1.0,
      imageUrl: "https://natashaskitchen.com/wp-content/uploads/2019/06/Classic-coleslaw-recipe-3.jpg"),
  FoodItem(id: 6, title: "Fruit Salad", hotel: "Java", price: 1.0, imageUrl: "https://hips.hearstapps.com/hmg-prod/images/fruit-salad-horizontal-jpg-1522181219.jpg"),
  FoodItem(id: 7, title: "Potato Salad", hotel: "Beef Eaters", price: 1.0, imageUrl: "https://www.inspiredtaste.net/wp-content/uploads/2016/10/Easy-Potato-Salad-Recipe-2-1200.jpg"),
  FoodItem(id: 8, title: "Garden Salad", hotel: "Garden Fresh", price: 1.0, imageUrl: "https://www.culinaryhill.com/wp-content/uploads/2016/05/Easy-Garden-Salad-Culinary-Hill-5-660x660.jpg"),
  FoodItem(id: 9, title: "Greek Salad", hotel: "Salad Bar", price: 1.0, imageUrl: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2010/4/23/0/BX0204_greek-salad_s4x3.jpg.rend.hgtvcom.616.462.suffix/1529943050536.jpeg"),
  FoodItem(id: 10,
      title: "Kachumbari",
      hotel: "Local Delis",
      price: 1.0,
      imageUrl: "https://www.africanbites.com/wp-content/uploads/2015/02/IMG_8420.jpg")
]);
class FoodItemList{
  List<FoodItem> foodItems;

  FoodItemList({@required this.foodItems});

}
class FoodItem{
  int id;
  String title;
  String hotel;
  double price;
  String imageUrl;
  int quantity;

  FoodItem({
    @required this.id,
    @required this.title,
    @required this.hotel,
    @required this.price,
    @required this.imageUrl,
    this.quantity = 1});

  void incrementQuantity() {
    this.quantity++;
  }
  void decrementQuantity() {
    this.quantity=this.quantity-1;
  }

  void clearQuantity(){
    this.quantity = 0;
  }
}