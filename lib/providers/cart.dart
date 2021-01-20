import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items={};

  Map<String, CartItem> get items {
    return {..._items};
  }
  int get itemCount{
    return _items.length;
  }
  double get totalAmount{
  var total=0.0;
    _items.forEach((key, value) {
     total+=value.price*value.quantity;
  });
    return total;
}
  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      //change quantity
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      CartItem cartItem = CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price);
      _items.putIfAbsent(productId, () => cartItem);
    }
    notifyListeners();
  }
  void deleteItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }
  void clear(){
    _items = {};
    notifyListeners();
  }
}
