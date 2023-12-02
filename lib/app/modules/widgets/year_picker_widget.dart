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
  });

  final List<DropdownMenuItem> items;
  final String? value;
  final String? hint;
  final Color? bgColor;
  final Color? textColor;

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
        onChanged: (_) {},
        value: value,
        dropdownColor: Colors.white,
        isDense: true,
        hint: Text(
          hint ?? '',
          style: TextStyle(color: textColor),
        ),
        iconEnabledColor: textColor,
      ),
    );
  }
}
