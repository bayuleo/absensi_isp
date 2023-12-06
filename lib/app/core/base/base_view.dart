import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../enum/page_state.dart';
import '../widgets/loading_overlay_widget.dart';
import 'base_controllerr.dart';

/// An abstract class on StatelessWidget for GetX.
///
/// {@tool snippet}
/// ```dart
/// class MyScreen extends BaseView<MyController> {
///  const MyScreen({Key? key}) : super(key: key);
///
///   @override
///   Widget buildScreen(BuildContext context) {
///     return Scaffold(
///       backgroundColor: theme.background,
///       appBar: AppBarWidget(
///         titleText: "Title",
///       ),
///       body: Center(
///         child: ElevatedButton(
///           onPress: controller.onTapHello
///           child: Text(
///             "Hello",
///             style: TextStyle(color: theme.babyBlue),
///           ),
///         ),
///       ),
///     );
///   }
/// }
/// ```
/// {@end-tool}
abstract class BaseView<T extends BaseController> extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  // AppThemeData get theme => AppTheme.of(Get.context!);
  Logger get logger => Get.find<Logger>();
  T get controller => Get.find<T>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (_) {
        return Stack(
          children: [
            buildScreen(context),
            if (_.pageState == PageState.LOADING) const LoadingOverlayWidget()
          ],
        );
      },
    );
  }

  Widget buildScreen(BuildContext context);
}
