import 'package:flutter/material.dart';
import 'package:pharmatoday/features/categories/views/list_view.dart';
import 'package:pharmatoday/features/products/views/list_view.dart';
import 'package:pharmatoday/models/Product.dart';

class ProductsScreen extends StatelessWidget {
  static String routeName = "/products";
  @override
  Widget build(BuildContext context) {
    List<Product>? products =
    ModalRoute
        .of(context)!
        .settings
        .arguments as List<Product>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body:  CustomScrollView(
        slivers: <Widget>[
           ProductsListView(products),
        ],
      ),
    );
  }

}
