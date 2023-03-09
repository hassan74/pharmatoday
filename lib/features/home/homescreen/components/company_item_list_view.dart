import 'package:flutter/material.dart';
import 'package:pharmatoday/app_theme.dart';

import '../../../../main.dart';
import '../../../../models/Product.dart';
import '../../../categories/models/categories_data.dart';
import '../../../details/details_screen.dart';
import '../../../products/products_screen.dart';
import '../../models/product_home_data.dart';

class HomeCompanyListView extends StatefulWidget {
  const HomeCompanyListView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

  @override
  _HomeCompanyListViewState createState() => _HomeCompanyListViewState();
}

class _HomeCompanyListViewState extends State<HomeCompanyListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<Company> itemData = Company.companiesList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: Container(
              height: 120,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: itemData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = itemData.length > 10 ? 10 : itemData.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController?.forward();

                  return CompanyView(
                    itemData: itemData[index],
                    animation: animation,
                    animationController: animationController!,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class CompanyView extends StatelessWidget {
  const CompanyView(
      {Key? key, this.itemData, this.animationController, this.animation})
      : super(key: key);

  final Company? itemData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return  Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation!.value), 0.0, 0.0),
            child: SizedBox(
                width: 130,
                child: GestureDetector(
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, left: 8, right: 8, bottom: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: HexColor("#5C5EDD").withOpacity(0.6),
                                  offset: const Offset(1.1, 4.0),
                                  blurRadius: 8.0),
                            ],
                            gradient: LinearGradient(
                              colors: <HexColor>[
                                HexColor("738AE6"),
                                HexColor("#5C5EDD"),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                          ),

                          child:Expanded(child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child:SizedBox(
                                      width: 130,
                                      child:  ClipRRect(
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
                                    child: Image.network(fit:BoxFit.fill ,itemData!.imagePath ,

                                  ),
                                  ))

                                ),
                                Expanded(
                                  flex: 3,
                                    child: Center(child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 8, right: 8, bottom: 8),
                                        child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 8,),
                                        Text(
                                          itemData!.name,
                                          style: TextStyle(
                                            fontFamily: MyAppTheme.fontName,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            letterSpacing: 0.2,
                                            color: MyAppTheme.white,
                                          ),
                                        ) ,

                                      ],
                                    )))),
                              ],
                            ),),
                          ),
                        ),

                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 84,
                          height: 84,
                          decoration: BoxDecoration(
                            color: MyAppTheme.nearlyWhite.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      /*   Positioned(
                    top: 0,
                    left: 8,
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset(itemData!.images[0]),
                    ),
                  )*/
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                        context, ProductsScreen.routeName,
                        arguments: itemData?.products);                  },
                )),
          );
      },
    );
  }
}
