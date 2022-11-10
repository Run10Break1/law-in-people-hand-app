import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:law_in_people_hand/model/api.dart';
import 'package:law_in_people_hand/model/entity/bill.dart';
import 'package:law_in_people_hand/path.dart';
import 'package:law_in_people_hand/utils.dart';
import 'package:law_in_people_hand/view/component/box.dart';
import 'package:law_in_people_hand/view/component/dropdown.dart';
import 'package:law_in_people_hand/view/component/loading.dart';

import '../model/entity/pageable.dart';
import 'component/color.dart';
import 'home.dart' show BillListType, WithTitle;


enum SortType {
  age("대", "age"),
  stage("단계", "stageOrder");

  final String korName;
  final String nameOnPredicate;

  const SortType(this.korName, this.nameOnPredicate);
}

enum SortOrder {
  asc,
  desc;
}

class Sort {
  final SortType type;
  final SortOrder order;

  const Sort(this.type, this.order);

  Sort copyWith({SortType? type, SortOrder? order}) {
    return Sort(
      type ?? this.type,
      order ?? this.order,
    );
  }
}

class SortNotifier extends StateNotifier<Sort> {

  SortNotifier() : super(const Sort(SortType.age, SortOrder.desc));

  void change({SortType? type, SortOrder? order}) {
    state = state.copyWith(type: type, order: order);
  }
}

final sortProvider = StateNotifierProvider<SortNotifier, Sort>((ref) {
  return SortNotifier();
});

final billListProvider = StateProvider<List<HavingBill>>((ref) {
  ref.watch(sortProvider);

  return [];
});

class BillList extends ConsumerStatefulWidget {
  final PathRouteEventRecorder recorder;
  late final BillListType billListType;

  BillList(this.recorder, {Key? key, Object? arguments}) : super(key: key) {
    billListType = (arguments as Map<String, dynamic>)["billListType"];
  }

  @override
  ConsumerState<BillList> createState() => _BillListState();
}

class _BillListState extends ConsumerState<BillList> {
  late final ScrollController scrollController;

  late Future<Pageable<HavingBill>> newBillPageableFuture;
  int page = 0;

  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(scrollCallback);

    // 처음 페이지에 진입했을 때 billList를 가져옵니다.
    insertNewBillList();
  }

  void scrollCallback() async {
    if(scrollController.offset < scrollController.position.maxScrollExtent) {
      return;
    }
    scrollController.removeListener(scrollCallback);

    insertNewBillList();

    scrollController.addListener(scrollCallback);
  }

  void insertNewBillList() {
    newBillPageableFuture = fetch(page: page)..then((Pageable<HavingBill> billPageable) {
      ref.read(billListProvider.state).update((state) {
        return [...state, ...billPageable.content];
      });
      page++;
    });
  }

  Future<Pageable<HavingBill>> fetch({required int page, int size = 10, int? userId}) async {
    final sort = ref.read(sortProvider);

    if(widget.billListType == BillListType.all) {
      final result = await ApiManager.instance.fetch(
        name: "getAllBillList",
        fromJson: Pageable<Bill>.fromJson,
        requestParam: RequestParam.fromJson({
          "page" : page,
          "size" : size,
          "sort" : "${sort.type.nameOnPredicate},${sort.order.name}",
        }),
      );
      return result;
    } else {
      if(userId == null) {
        throw Exception("userId가 null 이라서 '내가 투표한 법안'을 얻을 수 없습니다.");
      }

      return await ApiManager.instance.fetch(
        name: "getMyBillList",
        fromJson: Pageable<VotedBill>.fromJson,
        namedPathVariable: {
          "userId" : userId,
        },
        requestParam: RequestParam.fromJson({
          "page" : page,
          "size" : size,
          "sort" : "${sort.type}.${sort.order}",
        }),
      );
    }
  }

  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // sort를 변경할 때마다 billList를 가져옵니다.
    ref.listen(sortProvider, (previous, next) => insertNewBillList());

    return Scaffold(
      body: ColoredBox(
        color: MyColor.brightBlue,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 26, top: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "전체 법안",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 40,
                            child: Consumer(
                              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                final sort = ref.watch(sortProvider);
                                final sortNotifier = ref.read(sortProvider.notifier);

                                return Row(

                                  children: [
                                    SizedBox(
                                      width: 60,
                                      child: MyDropdown(
                                        icon: const Icon(
                                          Icons.expand_more,
                                          color: Colors.white,
                                        ),
                                        itemList: SortType.values,
                                        value: sort.type,
                                        onChanged: (sortType) {
                                          sortNotifier.change(type: sortType);
                                        },
                                        itemBuilder: (sortType) => Center(
                                          child: Text(
                                            sortType.korName,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        selectedItemBuilder: (buildContext) {
                                          return SortType.values.map((e) => Container(
                                            alignment: Alignment.center,
                                            constraints: const BoxConstraints(maxWidth: 36),
                                            child: Text(
                                              e.korName,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )).toList(growable: false);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    AnimatedRotation(
                                      duration: const Duration(milliseconds: 320),
                                      turns: sort.order == SortOrder.asc ? 0 : 1 / 4,
                                      child: GestureDetector(
                                        onTap: () {
                                          sortNotifier.change(order: sort.order == SortOrder.asc ? SortOrder.desc : SortOrder.asc);
                                        },
                                        child: const Icon(
                                          Icons.north_east,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      height: 30,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: -100,
                            top: -20,
                            child: Container(
                              width: 130,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          Transform.rotate(
                            angle: pi / 2,
                            child: SvgPicture.asset(
                              "images/bill_list/arrow.svg",
                              color: Colors.white,
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FutureBuilder(
                      future: newBillPageableFuture,
                      builder: (BuildContext context, AsyncSnapshot<Pageable<HavingBill>> snapshot) {
                        final billList = ref.watch(billListProvider);

                        if(snapshot.hasData) {
                          return ListView.builder(
                            controller: scrollController,
                            itemCount: billList.length,
                            itemBuilder: billSnippetBuilder,
                          );
                        } else if(snapshot.hasError) {
                          print(snapshot.error);
                          return const Center(
                            child: Text("error"),
                          );
                        } else /* loading */ {
                          return LayoutBuilder(
                            builder: (BuildContext context1, BoxConstraints constraints) {
                              return ListView.builder(
                                controller: scrollController,
                                itemCount: billList.length + 1,
                                itemBuilder: (BuildContext context2, int index) {
                                  if(index == billList.length) { // 마지막 요소(로딩을 보여줍니다.)
                                    if(billList.isEmpty) {
                                      return SizedBox(
                                        height: constraints.maxHeight,
                                        child: Center(
                                          child: MyCircularLoading(
                                            colors: const [
                                              Colors.white,
                                              Colors.white60,
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return SizedBox(
                                        height: 30,
                                        child: Center(
                                          child: MyCircularLoading(
                                            colors: const [
                                              Colors.white,
                                              Colors.white60,
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  } else {
                                    return billSnippetBuilder(context, index);
                                  }
                                },
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget billSnippetBuilder(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //if(index + 1 < itemCount && isDistinct())
          BillSnippet(
            billListType: widget.billListType,
            havingBill: ref.read(billListProvider)[index],
          ),
        ],
      ),
    );
  }

  bool isDistinct(Bill? a, Bill b) {
    return false;
  }

  Widget distinctBuilder(Bill? a, Bill b) {
    return Container();
  }
}


class BillSnippet extends StatelessWidget {
  final BillListType billListType;
  final HavingBill havingBill;

  const BillSnippet({
    Key? key,
    required this.billListType,
    required this.havingBill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyRoundedBox(
      elevation: 0,
      height: 200,
      width: double.infinity,
      borderWidth: 0,
      borderRadius: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WithTitle(
                    title: "법안명",
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        havingBill.bill.billName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  WithTitle(
                    title: "대",
                    child: Text(
                      havingBill.bill.age.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  WithTitle(
                    title: "단계",
                    child: Text(
                      havingBill.bill.stage.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 40,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: MyColor.brightBlue.onWhite(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    ">",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
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
