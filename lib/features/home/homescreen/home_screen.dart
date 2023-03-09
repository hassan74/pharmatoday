import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../app_theme.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../ui_view/glass_view.dart';
import 'components/company_item_list_view.dart';
import 'components/home_item_list_view.dart';
import '../../ui_view/title_view.dart';
import 'components/header_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  Animation<double>? topBarAnimation;
  int currentHeaderPage = 0;
  List<Map<String, String>> headerData = [
    {"text": "Clear !", "image": "assets/images/header1.png"},
    {"text": "Protection care", "image": "assets/images/header2.png"},
    {"text": "Pandaol", "image": "assets/images/header3.png"},
  ];

  List<Map<String, String>> videosData = [
    {"text": "Clear !", "url": "assets/images/header1.png"},
    {"text": "Protection care", "url": "assets/images/header2.png"},
    {"text": "Pandaol", "url": "assets/images/header3.png"},
  ];

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    const int count = 9;

    listViews.add(
      TitleView(
        titleTxt: 'Advertisements',
        subTxt: 'Details',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );
    listViews.add(CarouselSlider(
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
      items: headerData.map<Widget>((i) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                Image.asset(
                  fit: BoxFit.fill,
                  i["image"] ?? "",
                  height: getProportionateScreenHeight(150),
                  width: SizeConfig.screenWidth,
                ),
                /*  Spacer(),
                    Text(
                      i['text'] ?? "",
                      textAlign: TextAlign.center,
                    ),*/
                Spacer(),
              ],
            );
          },
        );
      }).toList(),
    ));
    /* listViews.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        headerData.length,
            (index) => buildDot(index: index),
      ),
    ));*/
    listViews.add(InkWell(
      child: TitleView(
        titleTxt: 'Companies',
        subTxt: 'ALL',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
      onTap: () {},
    ));

    listViews.add(
      HomeCompanyListView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 3, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Best Seller',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      HomeItemListView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 3, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
      ),
    );

/*    listViews.add(
     */ /* TitleView(
        titleTxt: 'Videos',
        subTxt: 'Details',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
            Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),*/ /*
      Text(
        "Videos",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: MyAppTheme.fontName,
          fontWeight: FontWeight.w500,
          fontSize: 18,
          letterSpacing: 0.5,
          color: MyAppTheme.lightText,
        ),
      ),

    );*/
    /*  listViews.add(
        CarouselSlider(
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
          items: videosData.map<Widget>((i) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  children: <Widget>[
                    FutureBuilder(
                      future: videoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: videoPlayerController.value.aspectRatio,
                            child: VideoPlayer(videoPlayerController),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                    */ /*  Spacer(),
                    Text(
                      i['text'] ?? "",
                      textAlign: TextAlign.center,
                    ),*/ /*
                    Spacer(),
                  ],
                );
              },
            );
          }).toList(),
        )


    );
*/

/*    listViews.add(
      GlassView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve: Interval((1 / count) * 8, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController
          !
      )
      ,
    );*/
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
          color: MyAppTheme.background,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[
                getMainListViewUI(),
                getAppBarUI(),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            ),
          ),
        );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: MyAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color:
                              MyAppTheme.grey.withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Pharma Today',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: MyAppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: MyAppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
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
