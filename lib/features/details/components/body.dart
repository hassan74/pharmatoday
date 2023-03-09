import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pharmatoday/features/cart/models/cart_item.dart';
import 'package:provider/provider.dart';

import '../../../components/default_button.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import '../../cart/CartProvider.dart';
import '../../cart/components/rounded_icon_btn.dart';
import '../../screen_success/login_success_screen.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class DetailsBody extends StatelessWidget {
  final Product product;

  const DetailsBody({Key? key, required this.product}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        RoundedIconBtn(
                          icon: Icons.remove,
                          press: () {},
                        ),
                        SizedBox(width: getProportionateScreenWidth(20)),
                        RoundedIconBtn(
                          icon: Icons.add,
                          showShadow: true,
                          press: () {},
                        ),
                      ],
                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {
                            final cart = Provider.of<CartProvider>(context ,listen: false);
                            context.read<CartProvider>().insertCart(product)
                                .then((value) {
                              cart.addTotalPrice(
                                  product.pharmPrice.toDouble());
                              cart.addCounter();
                              log('Product Added to cart');
                            }).onError((error, stackTrace) {
                              log(error.toString());
                            });
                            Navigator.pushNamed(
                                context, SuccessScreen.routeName,
                                arguments: SuccessArguments(
                                    message: "Added Successfully",
                                    backToHome: false));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
