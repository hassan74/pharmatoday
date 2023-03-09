import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:pharmatoday/app_theme.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class HeaderView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
   int currentHeaderPage = 0;
   HeaderView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> headerData = [
      {
        "text": "Welcome to Pharma Today, Let’s Go!",
        "image": "assets/images/header1.png"
      },
      {
        "text": "Welcome to Pharma Today, Let’s Go!",
        "image": "assets/images/header2.png"
      },
      {
        "text": "Welcome to Pharma Today, Let’s Go!",
        "image": "assets/images/header3.png"
      },
    ];
    List<String> images = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
      "https://wallpaperaccess.com/full/2637581.jpg"
    ];
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: MyAppTheme.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: MyAppTheme.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    animateToClosest: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    onPageChanged: (position, reason) {
                      print(reason);
                      print(CarouselPageChangedReason.controller);
                    },
                    enableInfiniteScroll: false,
                  ),
                  items: images.map<Widget>((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Column(children: <Widget>[
                          Expanded(
                            child: PageView.builder(
                              onPageChanged: (value) {
                                /*setState(() {
                                      currentHeaderPage = value;
                                    });*/
                              },
                              itemCount: headerData.length,
                              itemBuilder: (context, index) => Column(
                                children: <Widget>[
                                  Image.asset(
                                    fit: BoxFit.fill,
                                    headerData[index]["image"] ?? "",
                                    height: getProportionateScreenHeight(150),
                                    width: SizeConfig.screenWidth,
                                  ),
                                  Spacer(flex: 2),
                                  Text(
                                    headerData[index]['text'] ?? "",
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              headerData.length,
                                  (index) => buildDot(index: index),
                            ),
                          ),
                        ]);
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );

  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentHeaderPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentHeaderPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

