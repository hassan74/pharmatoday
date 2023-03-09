import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmatoday/extensions/app_image_view.dart';

import '../../models/Product.dart';
import 'base_product.dart';


extension View on Product {
  Widget getListView(
      {required BuildContext context,
        required VoidCallback showProductInfo,
        required VoidCallback onFavoritesClick}) {
    return BaseProductListItem(
      onClick: showProductInfo,
      bottomRoundButton:null,
      image: mainImage.getView(),
      specialMark: null,
      mainContentBuilder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: Theme.of(context).textTheme.headline6),
            Text("price: $pharmPrice", style: Theme.of(context).textTheme.headline6),
            Text("public price:"+pubPrice.toString(), style: Theme.of(context).textTheme.headline6),
            Text("Company :"+companyName.toString(), style: Theme.of(context).textTheme.headline6),
          ],
        );
      },
    );
  }

}

