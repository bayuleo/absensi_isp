import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

/// A mixin on StatelessWidget.
///
/// [BaseWidgetMixin] allows you to use theme and logger in a StatelessWidget faster and simpler.
///
/// {@tool snippet}
/// ```dart
/// class MyWidget extends StatelessWidget with BaseWidgetMixin {
///  const MyWidget({Key? key}) : super(key: key);
///
///   @override
///   Widget build(BuildContext context) {
///     return Center(
///       child: Text(
///         "Hello",
///         style: TextStyle(color: theme.babyBlue),
///       ),
///     );
///   }
/// }
/// ```
/// {@end-tool}
mixin BaseWidgetMixin on StatelessWidget {
  // AppThemeData get theme => AppTheme.of(Get.context!);
  Logger get logger => Get.find<Logger>();
}
