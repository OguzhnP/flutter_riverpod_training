import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_architecture/models/product_model.dart';

class CartStateNotifier extends StateNotifier<List<Product>> {
  CartStateNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }


  void clearCart() {
    state = [];
  }
}
