import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputDropDownWidget extends StatelessWidget {
  const InputDropDownWidget({
    super.key,
    required this.items,
    this.value,
    this.hint,
    this.bgColor,
    this.textColor,
    required this.onChange,
    this.selectedItemBuilder,
  });

  final List<DropdownMenuItem> items;
  final String? value;
  final String? hint;
  final Color? bgColor;
  final Color? textColor;
  final Function(dynamic) onChange;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: DropdownButton(
        items: items,
        onChanged: onChange,
        value: value,
        dropdownColor: Colors.white,
        isDense: true,
        style: TextStyle(color: Colors.black),
        selectedItemBuilder: selectedItemBuilder,
        hint: Text(
          hint ?? '',
          style: TextStyle(
            color: primaryTextColor,
          ),
        ),
        iconEnabledColor: textColor,
      ),
    );
  }
}
