import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'models/cart_item.dart';

class OpenFlutterCartTile extends StatefulWidget {
  final CartItem item;
  final Function(int quantity) onChangeQuantity;
  final Function() onAddToFav;
  final Function() onRemoveFromCart;
  final bool orderComplete;

  const OpenFlutterCartTile(
      {
      required this.item,
      required this.onChangeQuantity,
      required this.onAddToFav,
      required this.onRemoveFromCart,
      this.orderComplete = false});

  @override
  _OpenFlutterCartTileState createState() => _OpenFlutterCartTileState();
}

class _OpenFlutterCartTileState extends State<OpenFlutterCartTile> {
  bool showPopup = false;

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: AppSizes.linePadding * 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.lightGray.withOpacity(0.3),
                      blurRadius: AppSizes.imageRadius,
                      offset: Offset(0.0, AppSizes.imageRadius))
                ],
                color: AppColors.white),
            child: Stack(children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                      width: 104,
                      child:  Image.asset(widget.item.image)),
                  Expanded(child:Container(
                      padding: EdgeInsets.only(left: AppSizes.sidePadding),
                      width: width - 134,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                        Container(
                          width: width - 173,
                          child: Text(widget.item.title,
                              style: _theme.textTheme.headline5
                                  ?.copyWith(fontWeight: FontWeight.bold, color: _theme.primaryColor)),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: AppSizes.linePadding * 2)),
                        Padding(
                          padding: EdgeInsets.only(bottom: AppSizes.linePadding * 2),
                        ),

                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          widget.onChangeQuantity != null
                              ? SizedBox(
                            width: 120,
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                    onTap: () =>
                                    {widget.onChangeQuantity(widget.item.quantity - 1)},
                                    child: Container(
                                        alignment: Alignment.center,
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(18),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: AppColors.lightGray.withOpacity(0.3),
                                                  blurRadius: AppSizes.imageRadius,
                                                  offset: Offset(0.0, AppSizes.imageRadius))
                                            ]),
                                        child: Icon(Icons.remove))),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(AppSizes.linePadding * 2),
                                  child: Text(widget.item.quantity.toString(),
                                      style: _theme.textTheme.headline6),
                                ),
                                InkWell(
                                    onTap: (() =>
                                    {widget.onChangeQuantity(widget.item.quantity + 1)}),
                                    child: Container(
                                        alignment: Alignment.center,
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(18),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: AppColors.lightGray.withOpacity(0.3),
                                                  blurRadius: AppSizes.imageRadius,
                                                  offset: Offset(0.0, AppSizes.imageRadius))
                                            ]),
                                        child: Icon(Icons.add))),
                              ],
                            ),
                          )
                              : SizedBox(
                              width: 110,
                              child: Row(children: <Widget>[
                                Text('Units: ', style: _theme.textTheme.bodyText1),
                                Text(widget.item.quantity.toString(),
                                    style: _theme.textTheme.bodyText1?.copyWith(color: _theme.primaryColor)),
                              ])),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child:
                            Text((widget.item.pharmPrice* widget.item.quantity).toStringAsFixed(0)+" EG", style: _theme.textTheme.headline5),
                          )
                        ])
                      ]))
                  )

                ],
              ),
              showPopup
                  ? Positioned(
                      top: 10,
                      right: 30,
                      child: Container(
                          height: 90,
                          width: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                              color: AppColors.white,
                              border: Border.all(color: _theme.primaryColorLight)),
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                  onTap: (() => {widget.onAddToFav(), showPopup = false, setState(() => {})}),
                                  child: Container(
                                      width: 140,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(AppSizes.sidePadding),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(color: _theme.primaryColorLight, width: 0.4),
                                        ),
                                      ),
                                      child: Text('Add to Favorites'))),
                              InkWell(
                                  onTap: (() => {widget.onRemoveFromCart(), showPopup = false, setState(() => {})}),
                                  child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(AppSizes.sidePadding),
                                      child: Text('Remove from Cart'))),
                            ],
                          )))
                  : Container()
            ])));
  }
}
