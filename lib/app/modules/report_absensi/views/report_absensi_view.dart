import 'package:asiagolf_app/app/core/base/base_view.dart';
import 'package:asiagolf_app/app/modules/home/views/widgets/item_log_absensi_widget.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/report_absensi_controller.dart';

class ReportAbsensiView extends BaseView<ReportAbsensiController> {
  const ReportAbsensiView({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    var styleTitle = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
    var styleValue = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: primaryTextColor,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Absensi'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  'Report Absensi Januari 2024',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListTile(
                title: Text(
                  'Nama',
                  style: styleTitle,
                ),
                trailing: Text(
                  'Andri Prasmanan',
                  style: styleValue,
                ),
              ),
              ListTile(
                title: Text(
                  'Nomor Induk Karyawan',
                  style: styleTitle,
                ),
                trailing: Text(
                  '000032123',
                  style: styleValue,
                ),
              ),
              ListTile(
                title: Text(
                  'Jumlah Hari Masuk',
                  style: styleTitle,
                ),
                trailing: Text(
                  '22 Hari',
                  style: styleValue,
                ),
              ),
              ListTile(
                title: Text(
                  'Jumlah Jam Masuk',
                  style: styleTitle,
                ),
                trailing: Text(
                  '400 Jam',
                  style: styleValue,
                ),
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Log Absen (15)',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ItemLogAbsensiWidget(data: controller.dummyData);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 2,
                    );
                  },
                  itemCount: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
