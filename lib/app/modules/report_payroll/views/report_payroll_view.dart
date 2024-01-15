import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/report_payroll_controller.dart';

class ReportPayrollView extends GetView<ReportPayrollController> {
  const ReportPayrollView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReportPayrollView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReportPayrollView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
