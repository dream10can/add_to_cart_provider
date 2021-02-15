import 'package:add_to_cart_provider/model/item.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];

  double _price = 0.0;

  void addItem(Item item) {
    _items.add(item);

    _price += item.price;

    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);

    _price -= item.price;

    notifyListeners();
  }

  List<Item> get getItem {
    return _items;
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _price;
  }
}
