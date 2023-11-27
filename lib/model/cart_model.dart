import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List _shopItems = [
    ["Grey Shoes", "249", "assets/images/GreyShoes.png", Colors.blue, 1.0],
    ["White Rose Shoes", "269", "assets/images/WhiteRoseShoes.png", Colors.green, 1.0],
    ["Beige Shoes", "264", "assets/images/BeigeShoes.png", Colors.purple, 1.0],
    ["Blue Shoes", "220", "assets/images/BlueShoes.png", Colors.cyan, 1.0],
    ["White Shoes", "274", "assets/images/WhiteShoes.png", Colors.yellow, 1.0],
    ["Blue White Shoes", "311", "assets/images/BlueWhiteShoes.png", Colors.orange, 1.0],
  ];

  final List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  void addItemToCart(int index){
    if (!_cartItems.any((item) => listEquals(item, _shopItems[index]))) {
      _cartItems.add(_shopItems[index]);
    }
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
      totalPrice += ((double.parse(_cartItems[i][1]) * _cartItems[i][4]));
    }
    return totalPrice.toString();
  }
}