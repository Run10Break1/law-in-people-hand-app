import 'package:flutter/material.dart';

class MyDropdown<T> extends StatelessWidget {
  final List<T>? itemList;
  final Widget Function(T item)? itemBuilder;
  final void Function(T? item)? onChanged;
  final T? value;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Widget? hint;
  final bool? isExpanded;
  final Widget? icon;

  const MyDropdown({
    Key? key,
    this.itemList,
    this.itemBuilder,
    this.onChanged,
    this.value,
    this.selectedItemBuilder,
    this.hint,
    this.isExpanded,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<T>(
        hint: hint,
        isExpanded: isExpanded ?? false,
        icon: icon ?? const Icon(
          Icons.expand_more,
        ),
        items: itemList == null ? null : [
          for(final item in itemList!) DropdownMenuItem(
            value: item,
            child: itemBuilder!(item),
          ),
        ],
        value: value,
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
      ),
    );
  }
}
