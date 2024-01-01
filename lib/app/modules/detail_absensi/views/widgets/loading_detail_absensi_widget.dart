import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingDetailAbsensiWidget extends StatelessWidget {
  const LoadingDetailAbsensiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        direction: ShimmerDirection.ltr,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20),
              height: 80,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.black12,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20),
              height: 100,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.black12,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20),
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.black12,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20),
              height: 100,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.black12,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20),
              height: 160,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.black12,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20),
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.black12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
