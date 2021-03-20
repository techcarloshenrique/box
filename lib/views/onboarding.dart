import 'dart:io' show Platform;

import 'package:box/data/data.dart';
import 'package:box/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Onboarding extends StatefulWidget {
  @override
  _Onboarding createState() => _Onboarding();
}

class _Onboarding extends State<Onboarding> {
  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;
  PageController pageController = new PageController();
  double iniciarHeight = 0;
  @override
  void initState() {
    // PUT CONTENT(CONFIG) HERE TO WORK JUST IN THIS CLASS IN MAIN.DART
    super.initState();
    // THIS LINE HIDE STATUSBAR
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // THIS LINE MAKE STATUSBAR TRANSPARENT
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));*/
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      width: isCurrentPage ? 8.0 : 6.0,
      height: isCurrentPage ? 8.0 : 6.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
          controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
              iniciarHeight = 70;
              print(this.context);
            });
          },
          itemBuilder: (context, index) {
            return SliderContent(
              imgAssetPath: slides[index].getImgPath(),
              title: slides[index].getTitle(),
              desc: slides[index].getDesc(),
            );
          }),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              height: Platform.isIOS ? 70 : 60,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        pageController.animateToPage(slides.length - 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      child: Text("PULAR")),
                  Row(
                    children: <Widget>[
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false)
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        pageController.animateToPage(currentIndex + 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      child: Text("PRÓXIMO")),
                ],
              ),
            )
          : GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => Splash()),
                );
              },
              child: iniciar(context),
            ),
    );
  }
}

Widget iniciar(ctx) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(ctx).size.width,
    height: Platform.isIOS ? 70 : 60,
    //color: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      color: Colors.blue,
    ),
    child: Text(
      "INICIAR",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
  );
}

// ignore: must_be_immutable
class SliderContent extends StatelessWidget {
  String imgAssetPath, title, desc;
  SliderContent({this.imgAssetPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 70.0),
      height: 100,
      width: 100,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imgAssetPath,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
