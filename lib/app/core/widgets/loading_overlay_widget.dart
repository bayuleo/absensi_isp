import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';

import '../base/base_widget_mixin.dart';

class LoadingOverlayWidget extends StatelessWidget with BaseWidgetMixin {
  const LoadingOverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      ),
    );
  }
}
