import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:law_in_people_hand/path.dart';
import 'package:law_in_people_hand/utils.dart';
import 'package:law_in_people_hand/view/bill_list.dart';
import 'package:law_in_people_hand/view/component/button.dart';
import 'package:law_in_people_hand/view/home.dart';

import 'component/color.dart';


class BillDetail extends StatefulWidget {
  final PathRouteEventRecorder recorder;

  const BillDetail(this.recorder, {Key? key, Object? arguments}) : super(key: key);

  @override
  State<BillDetail> createState() => _BillDetailState();
}

class _BillDetailState extends State<BillDetail> with SingleTickerProviderStateMixin {

  late final AnimationController animationController;

  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
  }

  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("2$context");
    return Scaffold(
      body: ColoredBox(
        color: MyColor.brightBlue,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 30,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "0000000000??? ?????? ?????? ?????????",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 80,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                  child: Text(
                                    "??????????????????",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                visualDensity: const VisualDensity(horizontal: -1, vertical: -1),
                                onPressed: () {

                                },
                                icon: const Icon(
                                  Icons.help_outline,
                                  color: Colors.white60,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: ScrollConfiguration(
                              behavior: NoGlowScrollBehavior(),
                              child: SingleChildScrollView(
                                child: WithTitleConfiguration(
                                  data: WithTitleData(
                                    titleStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  child: DefaultTextStyle(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        WithTitle(
                                          title: "??????",
                                          child: Text(
                                            "???????????? ??? ???????????? ?????????-19??? ??????????????? ????????? ???????????????????????????????? ????????? ????????? ????????? ????????? ?????? ??????. ?????? ???????????????????????? ????????? ???????????? ???????????? ??? ?????? ??? ????????? ?????? ????????? ???????????? ?????????. ????????? ????????? ???????????? ?????? ????????? ???????????? ??????????????? ???????????? ????????? ????????? ?????? ?????????????????? ????????? ???????????? ????????? ????????????????????? ???????????? ????????? ?????? ??????????????? ????????? ?????? ???????????? ?????? ?????? ??????????????? ??????????????? ????????? ??? ??????. ???????????? ???????????? ????????? ????????? ???????????? 50%??? ????????? ????????? ????????? ???????????? ????????? ??????????????? ???????????? ????????? ???????????? ????????? ?????? ????????? ???????????? ???????????? ?????? ????????? ??????????????? ????????? ??????. ?????? ??????????????????????????? ???????????? ???????????? ?????? ???????????? ????????? ????????? ???????????? 50%?????? 70%??? ????????????, ???????????? ????????? 2020??? 6??? 30????????? 2021??? 12??? 31????????? ?????????????????? ??????????????? ????????? ????????? ??????????????? ??????(??? ???96??????3).",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        WithTitle(
                                          title: "?????? ?????????",
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Container( // 5 : 7
                                                width: 150,
                                                height: 210,
                                                decoration: BoxDecoration(
                                                  color: MyColor.grey.onWhite(0.4),
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    "images/bill_detail/person.svg",
                                                    width: 30,
                                                    height: 40,
                                                    color: MyColor.grey,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "000 ??????",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        WithTitle(
                                          title: "?????? ?????????",
                                          child: Text(
                                            "https://example.com/related-url",
                                            style: TextStyle(
                                              decoration: TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        WithTitle(
                                          title: "?????? ??????",
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 4),
                                            child: GridView.builder(
                                              shrinkWrap: true,
                                              physics: const ClampingScrollPhysics(),
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 0.58,
                                              ),
                                              itemCount: 10,
                                              itemBuilder: (BuildContext context, int index) {
                                                return Align(
                                                  alignment: index % 2 == 0 ? Alignment.topLeft : Alignment.topRight,
                                                  child: NewsSnippet(),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox( // padding
                    height: 55,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      animationController.forward(from: 0);
                    },
                    child: Text(
                      "??????????????? ??????",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      animationController.reset();
                    },
                    child: Text(
                      "??????????????? ??????",
                    ),
                  ),
                ],
              ),

              Positioned(
                bottom: 20,
                child: FAB(
                  controller: animationController,
                  rootDialWidth: 70,
                  speedDialWidth: 140,
                  speedDialHeight: 50,
                  width: 300,
                  height: 70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAB extends StatelessWidget {
  final AnimationController controller;
  final double speedDialWidth;
  final double speedDialHeight;
  final double width;
  final double height;
  final double rootDialWidth;

  late final Animation<double> speedDialScale;
  late final Animation<double> rootDialWidthScale;
  late final Animation<double> speedDialWrapWidth;


  FAB({
    Key? key,
    required this.controller,
    required this.speedDialWidth,
    required this.speedDialHeight,
    required this.width,
    required this.height,
    required this.rootDialWidth,
  }) : super(key: key) {
    speedDialScale = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0, 1,
        curve: Curves.ease,
      ),
    ));
    rootDialWidthScale = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0, 1,
        curve: Curves.easeOutSine,
      ),
    ));
    speedDialWrapWidth = Tween<double>(
      begin: width,
      end: speedDialWidth,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.7, 1,
        curve: Curves.ease,
      ),
    ));
  }

  bool isRightTop = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: isRightTop ? 0 : null,
                right: isRightTop ? null : 0,
                child: SizedBox(
                  width: speedDialWrapWidth.value,
                  child: Center(
                    child: Transform.scale(
                      scale: speedDialScale.value,
                      child: isRightTop ? left(context) : right(context),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: isRightTop ? null : 0,
                right: isRightTop ? 0 : null,
                child: SizedBox(
                  width: speedDialWrapWidth.value,
                  child: Center(
                    child: Transform.scale(
                      scale: speedDialScale.value,
                      child: isRightTop ? right(context) : left(context),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Transform.scale(
                  scale: rootDialWidthScale.value,
                  child: SizedBox(
                    width: rootDialWidth,
                    height: rootDialWidth,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(rootDialWidth / 2),
                            color: MyColor.gold.onWhite(),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "images/app/icon-gradient.svg",
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: rootDialWidth,
                          height: rootDialWidth,
                          child: const CircularProgressIndicator(
                            value: 1,
                            color: MyColor.gold,
                          ),
                        ),
                        SizedBox(
                          width: rootDialWidth,
                          height: rootDialWidth,
                          child: CircularProgressIndicator(
                            value: 0.1,
                            color: MyColor.ocher,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget left(BuildContext context) {
    return  MyContainedButton(
      width: speedDialWidth,
      height: speedDialHeight,
      decoration: (isPressed) => BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(

      ),
    );
  }

  Widget right(BuildContext context) {
    return MyContainedButton(
      width: speedDialWidth,
      height: speedDialHeight,
      decoration: (isPressed) => BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(

      ),
    );
  }
}

class NewsSnippet extends StatelessWidget {
  const NewsSnippet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 230,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: MyColor.blue,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2, left: 2, right: 2),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network("https://via.placeholder.com/150",),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "?????? ?????? ?????? ?????? ??????",
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "2022-10-10",
                      style: TextStyle(
                        color: MyColor.grey.onWhite(0.5),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
