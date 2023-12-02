import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentValueMonitorWidget extends StatelessWidget {
  const CurrentValueMonitorWidget({
    super.key,
    required this.title,
    required this.desc,
  });

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          desc,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
