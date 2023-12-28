import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingItemRequestWidget extends StatelessWidget {
  const LoadingItemRequestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: double.infinity,
        height: 80.0,
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          direction: ShimmerDirection.ltr,
          child: Container(
            width: 200,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Colors.black12,
            ),
          ),
        ),
      ),
    );
  }
}
