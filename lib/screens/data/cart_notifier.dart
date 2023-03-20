import 'package:flutter/material.dart';
import 'package:mvvm_architecture/models/product_model.dart';

class CartNotifier extends ChangeNotifier {
  List<Product> _cart = [];

  List<Product> get cart => _cart;

  void addProduct(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
