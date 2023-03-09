import 'package:flutter/material.dart';
import '../../../models/Product.dart';

class CartItem {
 int quantity;
  int id;
 String productId;
  String title, companyName, description;
  double pubPrice, pharmPrice;
  String image;
  CartItem(this.id, this.productId ,this.title, this.companyName, this.description,
      this.pubPrice, this.pharmPrice, this.image, this.quantity);
  CartItem.fromMap(Map<dynamic, dynamic> data)
      :
      id = data["id"],
      productId = data["productId"],
      title = data["title"],
      companyName = data["description"],
      description = data["companyName"],
      pubPrice = data["pubPrice"],
      pharmPrice = data["pharmPrice"],
      image = data["image"],
        quantity = data['quantity'];


  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'title': title,
      'description': description,
      'companyName': companyName,
      'pubPrice': pubPrice,
      'pharmPrice': pharmPrice,
      'image': image,
      'quantity': quantity,
    };
  }
}

// Demo data for our cart
var product1 = demoProducts[0];
var product2 = demoProducts[1];
var product3 = demoProducts[2];
List<CartItem> demoCarts = [
  CartItem(
      1,
      product1.id,
      product1.title,
      product1.companyName,
      product1.description,
      product1.pubPrice,
      product1.pharmPrice,
      product1.mainImage,
      2),
  CartItem(
      2,
      product2.id,
      product2.title,
      product2.companyName,
      product2.description,
      product2.pubPrice,
      product2.pharmPrice,
      product2.mainImage,
      2),
  CartItem(
      3,
      product3.id,
      product3.title,
      product3.companyName,
      product3.description,
      product3.pubPrice,
      product3.pharmPrice,
      product3.mainImage,
      2),
];
/*

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], quantity: 2),
  Cart(product: demoProducts[1], quantity: 1),
  Cart(product: demoProducts[3], quantity: 1),
];
*/
