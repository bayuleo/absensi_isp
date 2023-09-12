import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideScreenWidget extends StatelessWidget {
  final String assets;
  final String title;
  final String desc;
  const SlideScreenWidget({
    required this.assets,
    required this.title,
    required this.desc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          assets,
          height: 100.h,
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            height: 1.5,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
      ],
    );
  }
}
