import 'package:asiagolf_app/app/core/extention/dater_helper.dart';
import 'package:asiagolf_app/app/modules/detail_request/controllers/detail_request_controller.dart';
import 'package:asiagolf_app/app/modules/home/controllers/home_controller.dart';
import 'package:asiagolf_app/app/routes/app_pages.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/model/ijin/list/response_ijin_list_ijin_model.dart';

class ItemRequestLembur extends StatelessWidget {
  const ItemRequestLembur({
    super.key,
    required this.data,
  });

  final ResponseIjinListIjinModel data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return InkWell(
      onTap: () async {
        var isSuccessAddData = Get.toNamed(
          Routes.DETAIL_REQUEST,
          arguments: {
            "type": RequestType.lembur,
            "isCreate": false,
            "id": data?.id,
          },
        );
        if (isSuccessAddData != null) {
          controller.getListLembur();
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
                  Text(
                    data.timeStart
                            ?.toDateFromSimpleString()
                            ?.toSimpleString('dd') ??
                        '-',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    data.timeEnd
                            ?.toDateFromSimpleString()
                            ?.toSimpleString('MMM yy') ??
                        '-',
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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title ?? 'No Title',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          data.description,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: secondaryTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          data.status,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: secondaryTextColor,
                          ),
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
