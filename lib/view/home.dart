import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:law_in_people_hand/model/api.dart';
import 'package:law_in_people_hand/model/entity/bill.dart';
import 'package:law_in_people_hand/path.dart';
import 'package:law_in_people_hand/utils.dart';
import 'package:law_in_people_hand/view/component/button.dart';
import 'package:law_in_people_hand/view/login.dart';

import 'component/box.dart';
import 'component/color.dart';


enum RankType {
  voted,
  seen;
}

final rankTypeProvider = StateProvider<RankType>((ref) {
  return RankType.voted;
});

enum BillListType {
  all,
  my;
}

class Home extends StatefulWidget {
  final PathRouteEventRecorder recorder;

  const Home(this.recorder, {Key? key, Object? arguments}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.brightBlue,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Container(
        width: 80,
        color: Colors.white,
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Column(

              children: [
                const SizedBox(
                  height: 200,
                ),
                DrawerDestination(
                  icon: const Icon(
                    Icons.reorder,
                  ),
                  title: "전체 법안",
                  onPressed: () {
                    PathManager.instance.pushUniqueNamed(context, "bill_list", arguments: {
                      "billListType" : BillListType.all,
                    });
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                DrawerDestination(
                  icon: const Icon(
                    Icons.playlist_add_check,
                  ),
                  title: "투표한 법안",
                  onPressed: () {
                    PathManager.instance.pushUniqueNamed(context, "bill_list", arguments: {
                      "billListType" : BillListType.my,
                    });
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                DrawerDestination(
                  icon: const Icon(
                    Icons.settings,
                  ),
                  title: "설정",
                  onPressed: () {

                  },
                ),
              ],
            );
          },
        ),
      ),
      body: ColoredBox(
        color: MyColor.brightBlue,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        return Text(
                          "안녕하세요 ${ref.read(userProvider)!.name ?? "사용자"}님",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ),
                    Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        final rankType = ref.watch(rankTypeProvider);

                        return Text(
                          "오늘 ${rankType == RankType.voted ? "많이 투표한" : "많이 본"} 법안을 살펴볼까요?",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Consumer(
                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                      final rankType = ref.watch(rankTypeProvider);

                      return GestureDetector(
                        onTap: () {
                          ref.read(rankTypeProvider.state).update((state) {
                            return state == RankType.voted ? RankType.seen : RankType.voted;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 240),
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: MyColor.brightBlue.onWhite(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                            child: AnimatedAlign(
                              duration: const Duration(milliseconds: 240),
                              alignment: rankType == RankType.voted ? Alignment.centerLeft : Alignment.centerRight,
                              child: Container(
                                width: 22,
                                height: 22,
                                decoration: const ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Icon(
                                    rankType == RankType.voted ? Icons.how_to_vote : Icons.search,
                                    size: 16,
                                    color: MyColor.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    final rankedBillListAsync = ref.watch(rankedBillProvider);

                    return rankedBillListAsync.when(
                      data: (rankedBillList) {
                        return CarouselSlider.builder(
                          itemCount: rankedBillList.length,
                          options: CarouselOptions(
                            viewportFraction: 0.7,
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                            height: double.infinity,
                          ),
                          itemBuilder: (BuildContext context, int index, int realIndex) {
                            return Center(
                              child: RankedBillSnippet(
                                rankedBillList[index],
                                rank:  index + 1,
                              ),
                            );
                          },
                        );
                      },
                      error: callBackWhenError,
                      loading: callBackWhenLoading,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DrawerDestination extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Widget icon;

  const DrawerDestination({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconTheme(
            data: IconThemeData(
              color: MyColor.blue.onWhite(0.8),
              size: 32,
            ),
            child: icon,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: TextStyle(
              color: MyColor.blue.onWhite(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}


final rankedBillProvider = FutureProvider<List<BillWithCount>>((ref) async {
  final rankType = ref.watch(rankTypeProvider);

  if(rankType == RankType.voted) {
    return await ApiManager.instance.fetchList(
      name: "getMostVotedBill",
      fromJson: VotedBill.fromJson,
      mock: true,
    );
  } else {
    return await ApiManager.instance.fetchList(
      name: "getMostSeenBill",
      fromJson: SeenBill.fromJson,
      mock: true,
    );
  }
});

class RankedBillSnippet extends StatelessWidget {
  final BillWithCount billWithCount;
  final int rank;

  const RankedBillSnippet(this.billWithCount, {
    Key? key,
    required this.rank,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyRoundedBox(
      width: 248,
      height: 400,
      elevation: 3,
      borderRadius: 12,
      borderWidth: 2,
      borderColor: MyColor.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(

                    children: [
                      Text(
                        "#$rank  ",
                        style: TextStyle(
                          color: MyColor.blue.onWhite(0.6),
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Consumer(
                        builder: (BuildContext context, WidgetRef ref, Widget? child) {
                          final rankType = ref.watch(rankTypeProvider);
                          
                          return  RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: MyColor.blue.onWhite(0.6),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                const TextSpan(
                                  text: "현재 ",
                                ),
                                WidgetSpan(
                                  child: Container(
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 2,
                                          color: MyColor.blue,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${billWithCount.count}",
                                        style: const TextStyle(
                                          color: MyColor.blue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: rankType == RankType.voted ? " 명이 투표" : " 명이 관심",
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WithTitle(
                            title: "법안명",
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                billWithCount.bill.billName,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          WithTitle(
                              title: "발의자",
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  billWithCount.bill.proposer ?? "---",
                                ),
                              )
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: WithTitle(
                              isExpanded: true,
                              title: "개관",
                              child: ShaderMask(
                                blendMode: BlendMode.dstOut,
                                shaderCallback: (Rect bounds) => const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.white,
                                  ],
                                  stops: [
                                    0.8,
                                    1
                                  ],
                                ).createShader(bounds),
                                child: SingleChildScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: Column(

                                    children: [
                                      Text(
                                        billWithCount.bill.overview ?? "---",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: MyContainedButton(
                width: 180,
                height: 40,
                onPressed: () async {

                },
                child: const Center(
                  child: Text(
                    "더 알아보기",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WithTitle extends StatelessWidget {
  final String title;
  final Widget child;
  final CrossAxisAlignment crossAxisAlignment;
  final bool isExpanded;

  const WithTitle({
    Key? key,
    required this.title,
    required this.child,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configuration = WithTitleConfiguration.of(context);

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
      children: [
        Text(
          title,
          style: configuration?.titleStyle ?? TextStyle(
            color: MyColor.grey.onWhite(0.4),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        isExpanded ? Expanded(
          child: child,
        ) : child,
      ],
    );
  }
}

class WithTitleConfiguration extends InheritedWidget {
  final WithTitleData data;

  const WithTitleConfiguration({super.key, required Widget child, required this.data}) : super(child: child);

  static WithTitleData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WithTitleConfiguration>()?.data;
  }

  @override
  bool updateShouldNotify(covariant WithTitleConfiguration oldWidget) {
    return data.titleStyle != oldWidget.data.titleStyle;
  }

}

class WithTitleData {
  final TextStyle? titleStyle;

  WithTitleData({this.titleStyle});
}