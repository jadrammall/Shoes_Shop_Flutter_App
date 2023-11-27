import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List _shopItems = [
    ["Grey Shoes", "249", "assets/images/GreyShoes.png", Colors.blue],
    ["White Rose Shoes", "269", "assets/images/WhiteRoseShoes.png", Colors.green],
    ["Beige Shoes", "264", "assets/images/BeigeShoes.png", Colors.purple],
    ["Blue Shoes", "220", "assets/images/BlueShoes.png", Colors.cyan],
    ["White Shoes", "274", "assets/images/WhiteShoes.png", Colors.yellow],
    ["Blue White Shoes", "311", "assets/images/BlueWhiteShoes.png", Colors.orange],
  ];

  final List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  void addItemToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void removeAllItemsFromCart(){
    _cartItems.clear();
    notifyListeners();
  }

  String calculateTotal(){
    double totalPrice = 0;
    for (int i=0; i < _cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i] [1]);
    }
    return totalPrice.toString();
  }
}