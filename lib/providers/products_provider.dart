import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/product.dart';
class ProductsProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red! A red shirt - it is pretty red!A red shirt - it is pretty red!A red shirt - it is pretty red!A red shirt - it is pretty red!A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl:
            'https://www.dunhill.com/product_image/12398425GX/f/w640.jpg'),
    Product(
      id: 'p3',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
        id: 'p4',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl: 'https://www.dunhill.com/product_image/12398425GX/f/w640.jpg')
  ];

  List<Product> get items {
    return [..._items];
  }
  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }
  Product findById(String id) {
    return items.firstWhere((element) => id == element.id);
  }

  void addProduct() {
    notifyListeners();
  }
}
