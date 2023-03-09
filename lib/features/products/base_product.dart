import 'package:flutter/material.dart';

import '../../size_config.dart';

class BaseProductListItem extends StatelessWidget {
  final VoidCallback? onClick;
  final Widget? bottomRoundButton;
  final ImageProvider? image;
  final WidgetBuilder mainContentBuilder;
  final String? specialMark;
  final double imageHeight;
  final double imageWidth;

  const BaseProductListItem(
      { this.onClick,
         this.bottomRoundButton, this.image,
        required this.mainContentBuilder, this.imageHeight = 125,
        this.imageWidth = 125, this.specialMark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: imageHeight + 30,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.widgetSidePadding / 2),
      child: Opacity(
       // opacity: inactiveMessage == null ? 1 : 0.6,
        opacity: 1,
        child: Stack(
          children: <Widget>[
            InkWell(
              onTap: onClick,
              child: Container(
                height: imageHeight,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: imageWidth,
                        height: imageHeight,
                        decoration: BoxDecoration(
                          image: image == null
                              ? null
                              : DecorationImage(
                              image: image!, fit: BoxFit.cover),
                          color:  Color(0xFFE5E5E5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSizes.imageRadius),
                            bottomLeft: Radius.circular(AppSizes.imageRadius),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(11.0),
                          child: mainContentBuilder(context),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            bottomRoundButton == null
                ? Container()
                : Positioned(
              top: imageHeight - 32,
              right: 0,
              child: bottomRoundButton!,
            ),
            specialMark == null
                ? Container()
                : Positioned(
              left: 4,
              top: 6,
              child: Container(
                  padding: EdgeInsets.all(AppSizes.linePadding * 1.5),
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(AppSizes.imageRadius),
                    color: specialMark == 'New'
                        ? Colors.red
                        : Colors.black,
                  ),
                  child: Text(specialMark!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
            ),
          ],
        ),
      ),
    );
  }
}
