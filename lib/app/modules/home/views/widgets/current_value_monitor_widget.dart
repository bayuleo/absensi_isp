import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CurrentValueMonitorWidget extends StatelessWidget {
  const CurrentValueMonitorWidget({
    super.key,
    required this.title,
    required this.desc,
    this.isLoading = false,
  });

  final String title;
  final String desc;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isLoading
            ? LoadingAnimationWidget.staggeredDotsWave(
                color: primaryColor,
                size: 40.sp,
              )
            : Text(
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
