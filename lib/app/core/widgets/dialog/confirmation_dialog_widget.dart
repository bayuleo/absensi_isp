import 'package:asiagolf_app/app/utils/theme.dart';
import 'package:flutter/material.dart';

import '../../../modules/splash/views/widget/button_widget.dart';
import '../../base/base_widget_mixin.dart';

class ConfirmDialogWidget extends StatelessWidget with BaseWidgetMixin {
  const ConfirmDialogWidget({
    Key? key,
    this.tableData,
    required this.title,
    required this.content,
    this.textButtonConfirm,
    required this.onConfirm,
    required this.onCancel,
    this.confirmButtonKey = const ValueKey('confirm_dialog_confirm_button'),
    this.cancelButtonKey = const ValueKey('confirm_dialog_cancel_button'),
  }) : super(key: key);
  final Map<String, String>? tableData;
  final String title;
  final String content;
  final String? textButtonConfirm;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final Key confirmButtonKey;
  final Key cancelButtonKey;

  @override
  Widget build(BuildContext context) {
    final textLabelStyle = TextStyle(
      fontSize: 14,
      color: primaryColor,
    );
    final textValueStyle = TextStyle(
      fontSize: 14,
      color: primaryColor,
      fontWeight: FontWeight.bold,
    );
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: backgroundColor,
      insetPadding: const EdgeInsets.all(10),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 38),
      contentPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      actionsOverflowButtonSpacing: 10,
      scrollable: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      content: Column(
        children: [
          if (tableData != null)
            Table(
              columnWidths: const {0: FractionColumnWidth(0.42)},
              children: List.generate(
                tableData!.length,
                (index) => TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, top: 8),
                      child: Text(
                        tableData!.keys.toList()[index],
                        style: textLabelStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        tableData!.values.toList()[index],
                        style: textValueStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (tableData != null) const SizedBox(height: 32),
          Text(
            content,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
      actions: [
        ButtonWidget(
          key: confirmButtonKey,
          text: 'OK',
          pd: EdgeInsets.all(8),
          onTap: onConfirm,
        ),
        ButtonWidget(
          key: cancelButtonKey,
          text: 'CANCEL',
          isFill: false,
          mg: EdgeInsets.symmetric(vertical: 8),
          pd: EdgeInsets.all(8),
          onTap: onCancel,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
