import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BigClockWidget extends StatelessWidget {
  const BigClockWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          return Column(
            children: [
              Text(
                DateFormat('hh:mm:ss').format(DateTime.now()),
                style: TextStyle(
                  fontSize: 60.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                // 'Jumat, 20 Nov 2023',
                DateFormat('EEEE, dd MMM yyyy').format(DateTime.now()),
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
              ),
            ],
          );
        });
  }
}
