import 'package:asiagolf_app/app/core/extention/dater_helper.dart';
import 'package:asiagolf_app/app/modules/login/views/widget/text_field_with_label_widget.dart';
import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart' as L;

import '../controllers/detail_absensi_controller.dart';

class DetailAbsensiView extends GetView<DetailAbsensiController> {
  const DetailAbsensiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Detail Absen'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: GetBuilder<DetailAbsensiController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.detailData?.users.name ?? 'User',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      controller.onClickTitleClockIn();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Clock In',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right_outlined,
                              size: 28,
                            ),
                          ],
                        ),
                        Text(
                          controller.detailData?.date
                                  .toDate()
                                  ?.toSimpleString('dd MMMM yyyy hh:mm') ??
                              'Tanggal',
                          style: TextStyle(
                            color: secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 300,
                            child: FlutterMap(
                              mapController: controller.mapController,
                              options: MapOptions(
                                initialCenter:
                                    LatLng(controller.lat, controller.lon),
                                initialZoom: 16,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  userAgentPackageName: 'com.example.app',
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      point: LatLng(
                                        controller.lat,
                                        controller.lon,
                                      ),
                                      child: const Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                        size: 40,
                                      ),
                                      alignment: Alignment.topLeft,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFieldWithLabelWidget(
                            label: "Deskripsi",
                            controller: controller.detailTextEditingController,
                            enabled: false,
                            keyboardType: TextInputType.text,
                            minLines: 3,
                            maxLines: 5,
                            // validator: emailRequired,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CachedNetworkImage(
                            width: double.infinity,
                            height: 300.h,
                            fit: BoxFit.cover,
                            imageUrl: controller.detailData?.filename ?? '',
                            placeholder: (context, url) => L.Lottie.asset(
                              'assets/lottie/loading_image.json',
                              repeat: true,
                            ),
                            errorWidget: (context, url, error) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.error),
                                Text("Failed load image")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
