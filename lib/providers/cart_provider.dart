import 'package:flutter/material.dart';

import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartPovider extends ChangeNotifier {
  final CartModel _cart = CartModel();
  CartModel get cart => _cart;

  addCart(Product product) {
    int pos =
        _cart.productList.indexWhere((element) => element.id == product.id);
    if (pos == -1) {
      product.qteComd = 1;
      _cart.productList.add(product);
    } else {
      _cart.productList[pos].qteComd += 1;
    }
    _cart.totalHtc += product.newPrice;
    notifyListeners();
  }

  clearCart() {
    _cart.productList.clear();
    notifyListeners();
  }

  removeCart(Product product) {
    if (product.qteComd > 1) {
      int pos =
          _cart.productList.indexWhere((element) => element.id == product.id);
      if (pos != -1) {
        _cart.productList[pos].qteComd -= 1;
      }
    } else {
      _cart.productList = _cart.productList
          .where((element) => product.id == element.id)
          .toList();
    }
    notifyListeners();
  }
}
