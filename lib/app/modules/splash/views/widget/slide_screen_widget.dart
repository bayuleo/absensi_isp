import 'package:asiagolf_app/app/utils/extensions.dart';
import 'package:flutter/material.dart';
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
          height: 120.h,
        ),
        SizedBox(
          height: 32.h,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
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
          style: const TextStyle(
            fontSize: 14,
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
