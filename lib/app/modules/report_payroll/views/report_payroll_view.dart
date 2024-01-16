import 'package:asiagolf_app/app/core/base/base_view.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/report_payroll_controller.dart';

class ReportPayrollView extends BaseView<ReportPayrollController> {
  const ReportPayrollView({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    var styleTitle = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    );
    var styleValue = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: primaryTextColor,
    );
    var boldTitle = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
    var boldValue = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: primaryTextColor,
    );
    var boldTotalTitle = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
    );
    var boldTotalValue = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: primaryTextColor,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Payroll'),
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
                  'Report Payroll Januari 2024',
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
                  style: boldTitle,
                ),
                trailing: Text(
                  'Andri Prasmanan',
                  style: boldValue,
                ),
              ),
              ListTile(
                title: Text(
                  'Nomor Induk Karyawan',
                  style: boldTitle,
                ),
                trailing: Text(
                  '000032123',
                  style: boldValue,
                ),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                title: Text(
                  'Jumlah Hari Kerja',
                  style: styleTitle,
                ),
                trailing: Text(
                  '20 Hari',
                  style: styleValue,
                ),
              ),
              ListTile(
                title: Text(
                  'Gaji per Hari',
                  style: styleTitle,
                ),
                trailing: Text(
                  'Rp 120.000',
                  style: styleValue,
                ),
              ),
              ListTile(
                title: Text(
                  'Gaji Satu Bulan',
                  style: boldTitle,
                ),
                trailing: Text(
                  'Rp 2.600.000',
                  style: boldValue,
                ),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                title: Text(
                  'Jumlah Lembur',
                  style: styleTitle,
                ),
                trailing: Text(
                  '120 Menit',
                  style: styleValue,
                ),
              ),
              ListTile(
                title: Text(
                  'Jumlah Gaji Lembur',
                  style: boldTitle,
                ),
                trailing: Text(
                  'Rp 200.000',
                  style: boldValue,
                ),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                title: Text(
                  'Jumlah Terlambat',
                  style: styleTitle,
                ),
                trailing: Text(
                  '20 Menit',
                  style: styleValue,
                ),
              ),
              ListTile(
                title: Text(
                  'Potongan Keterlambatan',
                  style: styleTitle,
                ),
                trailing: Text(
                  'Rp 20.000',
                  style: styleValue,
                ),
              ),
              ListTile(
                title: Text(
                  'Potongan Lain - lain',
                  style: styleTitle,
                ),
                trailing: Text(
                  'Rp 5.000',
                  style: styleValue,
                ),
              ),
              ListTile(
                title: Text(
                  'Total Potongan',
                  style: boldTitle,
                ),
                trailing: Text(
                  'Rp 25.000',
                  style: boldValue,
                ),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                title: Text(
                  'Total Gaji Diterima',
                  style: boldTotalTitle,
                ),
                trailing: Text(
                  'Rp 2.775.000',
                  style: boldTotalValue,
                ),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
