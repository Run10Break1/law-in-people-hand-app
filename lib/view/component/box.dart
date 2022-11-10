import 'package:flutter/material.dart';

import 'color.dart';

class MyRoundedBox extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final Widget? child;

  const MyRoundedBox({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CardTheme cardTheme = CardTheme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: Material(
        type: MaterialType.card,
        color: color ?? cardTheme.color,
        shadowColor: shadowColor ?? cardTheme.shadowColor,
        surfaceTintColor: surfaceTintColor ?? cardTheme.surfaceTintColor,
        elevation: elevation ?? cardTheme.elevation ?? 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor ?? Colors.black,
            width: borderWidth ?? 0,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: child,
      ),
    );
  }
}


class MyPanel extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? title;
  final List<Widget> actions;
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final Color? borderColor;
  final double? borderWidth;
  final Widget child;
  final bool isExpanded;
  final EdgeInsets? padding;

  MyPanel({
    Key? key,
    this.width,
    this.height,
    this.title,
    this.actions = const [],
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.borderColor,
    this.borderWidth,
    required this.child,
    this.isExpanded = false,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyRoundedBox(
      width: width,
      height: height,
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation ?? 8,
      borderRadius: 16,
      borderColor: borderColor ?? Colors.transparent,
      borderWidth: borderWidth ?? 0,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
          children: [
            if(title != null || actions.isNotEmpty) SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    title ?? const SizedBox.shrink(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for(int i = 0; i < actions.length; i++) Padding(
                          padding: EdgeInsets.only(right: i == actions.length - 1 ? 30 : 10),
                          child: actions[i],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            isExpanded ? Expanded(
              child: child,
            ) : child,
          ],
        ),
      ),
    );
  }
}

class MyLabelBox extends StatefulWidget {
  final Color labelColor;
  final Color? color;
  final double? width;
  final double? height;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final bool isExpanded;
  final Widget child;

  const MyLabelBox({
    Key? key,
    required this.labelColor,
    this.width,
    this.height,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    required this.child,
    this.isExpanded = true,
  }) : super(key: key);

  @override
  State<MyLabelBox> createState() => _MyLabelBoxState();
}

class _MyLabelBoxState extends State<MyLabelBox> {
  final key = GlobalKey();
  double labelHeight = 0;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(mounted) {
        setState(() {
          labelHeight = key.currentContext!.size!.height;
        });
      }
    });

    return MyRoundedBox(
      width: widget.width,
      height: widget.height,
      color: widget.color,
      shadowColor: widget.shadowColor,
      surfaceTintColor: widget.surfaceTintColor,
      elevation: widget.elevation ?? 0,
      borderColor: widget.borderColor,
      borderWidth: widget.borderWidth ?? 2,
      borderRadius: widget.borderRadius ?? 10,
      child: Row(
        mainAxisSize: widget.isExpanded ? MainAxisSize.max : MainAxisSize.min,
        children: [
          SizedBox(
            width: 30,
            height: labelHeight,
            child: Padding(
              padding: const EdgeInsets.only(left: 6, top: 5, bottom: 5, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.labelColor,
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
                ),
              ),
            ),
          ),
          widget.isExpanded ? Expanded(
            key: key,
            child: widget.child,
          ) : Builder(
            key: key,
            builder: (BuildContext context) {
              return widget.child;
            },
          ),
        ],
      ),
    );
  }
}


/*
void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<List<int>> indexList = [[], [], []];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 500,
            child: MyLabelBox(
              labelColor: Colors.red,
              child: Container(
                height: 200,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/


class MyOneSelectBox<T> extends StatelessWidget {
  final int? index;
  final List<T> dataList;
  final Widget Function(T data, int index, bool isSelected) builder;
  final MainAxisSize? mainAxisSize;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final void Function(T data, int newIndex) onChanged;

  const MyOneSelectBox({
    Key? key,
    this.index,
    required this.builder,
    required this.dataList,
    this.mainAxisSize,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        for(int i = 0; i < dataList.length; i++) GestureDetector(
          onTap: () {
            onChanged(dataList[i], i);
          },
          child: builder(dataList[i], i, i == index),
        ),
      ],
    );
  }
}

class MyMultiSelectBox<T> extends StatelessWidget {
  final List<int> indexList;
  final List<T> dataList;
  final Widget Function(T data, int index, bool isSelected, bool isLast) builder;
  final MainAxisSize? mainAxisSize;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final void Function(List<T> dataList, List<int> newIndexList, bool isRemoved, T data, int index) onChanged;

  const MyMultiSelectBox({
    Key? key,
    List<int>? indexList,
    required this.dataList,
    required this.builder,
    this.mainAxisSize,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    required this.onChanged,
  }) : indexList = indexList ?? const [], super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        for(int i = 0; i < dataList.length; i++) GestureDetector(
          onTap: () {
            final data = dataList[i];
            late final bool isRemoved;
            final newIndexList = (isRemoved = indexList.contains(i)) ? ([...indexList]..remove(i)) : [...indexList, i];
            onChanged(newIndexList.map((e) => dataList[e]).toList(growable: false), newIndexList, isRemoved, data, i);
          },
          child: builder(dataList[i], i, indexList.contains(i), i == dataList.length - 1),
        ),
      ],
    );
  }
}

class MyGroupedMultiSelectBox<T> extends StatefulWidget {
  final Widget Function() groupBuilder;
  final double? gap;
  final List<int>? indexList;
  final List<T> dataList;
  final Widget Function(T data, int index, bool isSelected, bool isLast) dataBuilder;
  final void Function(List<T> dataList, List<int> newIndexList, bool isRemoved, T data, int index) onChanged;

  const MyGroupedMultiSelectBox({
    Key? key,
    required this.groupBuilder,
    this.gap,
    this.indexList,
    required this.dataList,
    required this.dataBuilder,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<MyGroupedMultiSelectBox<T>> createState() => _MyGroupedMultiSelectBoxState<T>();
}

class _MyGroupedMultiSelectBoxState<T> extends State<MyGroupedMultiSelectBox<T>> {
  final key = GlobalKey();
  double height = 0;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          height = key.currentContext!.size!.height;
        });
    });

    return Row(
      children: [
        SizedBox(
          height: height,
          child: widget.groupBuilder(),
        ),
        SizedBox(
          width: widget.gap ?? 20,
        ),
        Expanded(
          key: key,
          child: MyMultiSelectBox(
            indexList: widget.indexList,
            dataList: widget.dataList,
            builder: widget.dataBuilder,
            mainAxisSize: MainAxisSize.min,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}

class MyMultiGroupedMultiSelectBox<T> extends StatelessWidget {
  final Widget Function(Object? groupData, int i, bool containSelected) groupBuilder;
  final List<Object?>? groupDataList;
  final double? gap;
  final double? groupGap;
  late final List<List<int>> indexList;
  final List<List<T>> dataList;
  final Widget Function(T data, int index, bool isSelected, bool isLast, int groupIndex) dataBuilder;
  final bool isOnly;
  final void Function(List<List<T>> dataList, List<List<int>> newIndexList) onChanged;
  final int size;

  MyMultiGroupedMultiSelectBox({
    Key? key,
    required this.dataList,
    required this.groupBuilder,
    this.groupDataList,
    this.gap,
    this.groupGap,
    List<List<int>>? indexList,
    required this.dataBuilder,
    bool? isOnly,
    required this.onChanged,
  }) : isOnly = isOnly ?? false, size = dataList.length, super(key: key) {
    this.indexList =
    [...(indexList ?? []), ...List.generate(size, (index) => const [], growable: false)]..length = size;

    assert(!this.isOnly || (this.isOnly && [ for(final e in this.indexList) ...e ].length <= 1));
  }

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        for(int i = 0; i < size; i++) Padding(
          padding: EdgeInsets.only(bottom: i == size - 1 ? 0 : groupGap ?? 18),
          child: MyGroupedMultiSelectBox(
            groupBuilder: () {
              return groupBuilder(groupDataList == null ? null : groupDataList![i], i, indexList[i].isNotEmpty);
            },
            gap: gap,
            indexList: indexList[i],
            dataList: dataList[i],
            onChanged: (List<T> dataListInGroup, List<int> indexListInGroup, _, __, ___) {
              List<List<int>> newIndexList = [
                for(int j = 0; j < size; j++)
                  if(i == j) isOnly ? Set.of(indexListInGroup).difference(Set.of(indexList[j])).toList(growable: false) : indexListInGroup
                  else isOnly ? [] : indexList[j],
              ];

              List<List<T>> newDataList = [
                for(int j = 0; j < size; j++) [
                  for(int k in newIndexList[j]) dataList[j][k],
                ],
              ];

              onChanged(newDataList, newIndexList);
            },
            dataBuilder: (T data, int index, bool isSelected, bool isLast) {
              return dataBuilder(data, index, isSelected, isLast, i);
            },
          ),
        ),
      ],
    );
  }
}



