// Product List Screen View
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:pharmatoday/features/products/product_view.dart';

import '../../../models/Product.dart';
import '../../../size_config.dart';
import '../../details/details_screen.dart';

class ProductsListView extends StatelessWidget {
  ProductsListView( this.products);
  final List<Product> products ;
  @override
  Widget build(BuildContext context) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
              return Padding(
                padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
                child: products[index].getListView(
                    context: context,
                    showProductInfo: () {
                      Navigator.pushNamed(
                        context,
                        DetailsScreen.routeName,
                        arguments: ProductDetailsArguments(product: products[index]),
                      );                    },
                    onFavoritesClick: () {

                    },
                  )) ;

          },
          childCount: products.length,
        ),
      );
  }
}
