import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CartProvider.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';
import 'models/cart_item.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(context),
      body: CartBody(),
      bottomNavigationBar: CheckoutCard(),
    );


  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "${context.watch<CartProvider>().quantity} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
