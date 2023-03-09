
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../database/DBHelper.dart';
import '../../models/Product.dart';
import 'models/cart_item.dart';

class CartProvider with ChangeNotifier {
  DBHelper dbHelper = DBHelper();
  int _counter = 0;
  int _quantity = 1;

  int get counter => _counter;

  int get quantity => _quantity;

  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  List<CartItem> cart = [];

  Future<List<CartItem>?> getData() async {
    try{
      cart = await dbHelper.getCartList();
      log("cartlength ${cart.length}");
      notifyListeners();
      return cart;
    }catch(e){
      log("exception ${e}");
      return null;
    }
  }

  Future<CartItem> insertCart(Product product) async {
    CartItem cart =await dbHelper.insert(
      CartItem(
          0,
          product.id,
          product.title,
          product.companyName,
          product.description,
          product.pubPrice,
          product.pharmPrice,
          product.mainImage,
          1),
    );
    log("cart inserted ${cart.quantity}");
    notifyListeners();
    return cart;
  }

  void _setPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_items', _counter);
    prefs.setInt('item_quantity', _quantity);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_items') ?? 0;
    _quantity = prefs.getInt('item_quantity') ?? 1;
    _totalPrice = prefs.getDouble('total_price') ?? 0;
  }

  void addCounter() {
    _counter++;
    _setPrefsItems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setPrefsItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefsItems();
    return _counter;
  }

  void addQuantity(int id) {
    final index = cart.indexWhere((element) => element.id == id);
    cart[index].quantity = cart[index].quantity + 1;
    _setPrefsItems();
    notifyListeners();
  }

  void deleteQuantity(int id) {
    final index = cart.indexWhere((element) => element.id == id);
    final currentQuantity = cart[index].quantity;
    if (currentQuantity <= 1) {
      currentQuantity == 1;
    } else {
      cart[index].quantity = currentQuantity - 1;
    }
    _setPrefsItems();
    notifyListeners();
  }

  void removeItem(int id) {
    final index = cart.indexWhere((element) => element.id == id);
    cart.removeAt(index);
    _setPrefsItems();
    notifyListeners();
  }

  int getQuantity(int quantity) {
    _getPrefsItems();
    return _quantity;
  }

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefsItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefsItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefsItems();
    return _totalPrice;
  }
}
