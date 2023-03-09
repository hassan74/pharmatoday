import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import '../CartProvider.dart';
import '../cart_tile.dart';
import '../models/cart_item.dart';
import 'cart_card.dart';

class CartBody extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<CartBody> {
  @override
  void initState() {
    super.initState();
    context.read<CartProvider>().getData();
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: context.watch<CartProvider>().cart.length,
        itemBuilder: (context, index) =>
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: Key(context.watch<CartProvider>().cart[index].id.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                  //  context.watch<CartProvider>().cart.removeAt(index);
                  });
                },
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset("assets/icons/Trash.svg"),
                    ],
                  ),
                ),
                //child: CartCard(cart: demoCarts[index]),
                child: OpenFlutterCartTile(
                  item: context.watch<CartProvider>().cart[index],
                  onChangeQuantity: ((int quantity) =>
                  {
                    setState(() {
                     // context.watch<CartProvider>().cart[index].quantity = quantity;
                    })
                  }),
                  onAddToFav: () {},
                  onRemoveFromCart: () {},
                ),
              ),
            ),
      ),
    );
  }
}
