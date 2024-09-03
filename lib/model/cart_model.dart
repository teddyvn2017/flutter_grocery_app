import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ['Avocado', '4.0', 'lib/images/avocado.png', Colors.green],
    ['Banana', '2.5', 'lib/images/banana.png', Colors.yellow],
    ['Chicken', '12.8', 'lib/images/chicken.png', Colors.brown],
    ['Water', '1.0', 'lib/images/water_bottle.png', Colors.blue],
  ];

  final List _cartItems = [];
  get shopItems => _shopItems;
  get cartItems => _cartItems;

  void addtoCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removefromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String totalprice() {
    double tp = 0;
    for (int i = 0; i < cartItems.length; i++) {
      tp += double.parse(cartItems[i][1]); //vị trí 1 là giá tiền
    }
    return tp.toStringAsFixed(2);
  }
}
