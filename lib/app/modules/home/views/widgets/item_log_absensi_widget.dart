import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemLogAbsensiWidget extends StatelessWidget {
  const ItemLogAbsensiWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('08:02'),
                Text('21 Apr'),
              ],
            ),
            Text('Clock In'),
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
