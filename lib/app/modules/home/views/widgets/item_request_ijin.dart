import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemRequestIjin extends StatelessWidget {
  const ItemRequestIjin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.onClickLogAbsenItem();
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                children: [
                  Text(
                    '28',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Apr 23',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: secondaryTextColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 12.w,
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ijin Menikah',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Ijin menikah dilaksanakan di luar pulau.',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: secondaryTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              'Cuti | ',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: secondaryTextColor,
                              ),
                            ),
                            Text(
                              '3 hari | ',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: secondaryTextColor,
                              ),
                            ),
                            Text(
                              'Pending',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: secondaryTextColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
