import 'package:asiagolf_app/app/core/extention/dater_helper.dart';
import 'package:asiagolf_app/app/data/model/ijin/list/response_ijin_list_ijin_model.dart';
import 'package:asiagolf_app/app/modules/detail_request/controllers/detail_request_controller.dart';
import 'package:asiagolf_app/app/modules/home/controllers/home_controller.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemRequestIjin extends StatelessWidget {
  const ItemRequestIjin({
    super.key,
    this.dataIjin,
  });

  final ResponseIjinListIjinModel? dataIjin;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return InkWell(
      onTap: () async {
        var isSuccessAddData = Get.toNamed(
          Routes.DETAIL_REQUEST,
          arguments: {
            "type": RequestType.ijin,
            "isCreate": false,
            "id": dataIjin?.id,
          },
        );
        if (isSuccessAddData != null) {
          controller.getListIjin();
        }
      },
      child: Column(
        children: [
          SizedBox(height: 12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 40.w,
                    child: Center(
                      child: Text(
                        dataIjin?.timeStart
                                ?.toDateFromSimpleString()
                                ?.toSimpleString('dd') ??
                            '-',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.w,
                    child: Center(
                      child: Text(
                        dataIjin?.timeEnd
                                ?.toDateFromSimpleString()
                                ?.toSimpleString('MMM yy') ??
                            '-',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: secondaryTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dataIjin?.title ?? 'No Title',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          dataIjin?.description ?? '',
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
                              '${dataIjin?.type} | ',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: secondaryTextColor,
                              ),
                            ),
                            // Text(
                            //   '3 hari | ',
                            //   style: TextStyle(
                            //     fontSize: 10,
                            //     fontWeight: FontWeight.w400,
                            //     color: secondaryTextColor,
                            //   ),
                            // ),
                            Text(
                              '${dataIjin?.status.toUpperCase()}',
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
          SizedBox(height: 6.h),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
