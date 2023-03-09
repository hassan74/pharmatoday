// Category List View
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:pharmatoday/features/products/products_screen.dart';
import '../../../size_config.dart';
import '../category_list_element.dart';
import '../models/categories_data.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView() ;

  @override
  _CategoriesListViewState createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var widgetWidth = width - AppSizes.sidePadding * 4;
    var _theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
          Padding(
            padding: EdgeInsets.only(
              top: AppSizes.sidePadding,
            ),
          ),
          Column(
            children: buildCategoryList(Company.companiesList),
          )
        ],
      ),
    );
  }

  List<Widget> buildCategoryList(List<Company> categories) {
    var elements = <Widget>[];
    if (categories != null) {
      for (var i = 0; i < categories.length; i++) {
        elements.add(
          InkWell(
            onTap:(){
              Navigator.pushNamed(
                  context, ProductsScreen.routeName,
                  arguments: categories[i].products);
            },
            child: OpenFlutterCatregoryListElement(category: categories[i]),
          ),
        );
      }
    }
    return elements;
  }
}
