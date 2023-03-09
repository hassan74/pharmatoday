import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'models/categories_data.dart';

class OpenFlutterCatregoryListElement extends StatelessWidget {
  final Company category;

  const OpenFlutterCatregoryListElement({required this.category});

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            top: AppSizes.sidePadding,
            bottom: AppSizes.sidePadding,
            left: AppSizes.sidePadding * 2,
            right: AppSizes.sidePadding),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: _theme.primaryColorLight, width: 0.4),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.network(fit: BoxFit.fill, category.imagePath),
            ),
        SizedBox(width: 5,),
        Text(category.name,
            style: _theme.textTheme.headline4
                ?.copyWith(fontWeight: FontWeight.normal)),
          ],
        ));
  }
}
