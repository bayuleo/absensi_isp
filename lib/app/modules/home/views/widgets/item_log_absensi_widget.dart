import 'package:asiagolf_app/app/core/enum/absent_type.dart';
import 'package:asiagolf_app/app/core/extention/dater_helper.dart';
import 'package:asiagolf_app/app/data/model/absent/response_absent_data_absent_model.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemLogAbsensiWidget extends StatelessWidget {
  const ItemLogAbsensiWidget({
    super.key,
    this.data,
  });

  final ResponseAbsentDataAbsentModel? data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data?.time ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  (data?.date ?? '').toDate()?.toSimpleString() ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: secondaryTextColor,
                  ),
                ),
              ],
            ),
            Text(data?.type == AbsentType.checkIn.key
                ? 'Clock In'
                : 'Clock Out'),
            Text('>'),
          ],
        ),
        const Divider(),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
