import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Widget? widget;
  final bool isFill;
  final bool isCollapse;
  final TextStyle? textStyle;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final double borderRadiusSize;
  final double? width;
  final BoxDecoration? containerStyle;
  final EdgeInsets? pd;
  final EdgeInsets? mg;
  final Function onTap;
  final bool enabled;
  final bool isLoading;
  final Color? buttonColor;
  final Widget? tail;
  final Widget? prefix;

  const ButtonWidget({
    Key? key,
    this.text = '',
    this.widget,
    this.isFill = true,
    this.isCollapse = false,
    this.textStyle,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w700,
    this.maxLines = 1,
    this.borderRadiusSize = 15,
    this.width,
    this.containerStyle,
    this.pd,
    this.mg,
    this.enabled = true,
    this.isLoading = false,
    this.buttonColor,
    this.tail,
    this.prefix,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isCollapse) {
      return Expanded(child: button(context));
    }
    return button(context);
  }

  Widget button(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      margin: mg ?? EdgeInsets.zero,
      decoration: enabled
          ? containerStyle ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadiusSize),
                border: isFill
                    ? null
                    : Border.all(
                        width: 1,
                        color: const Color(0xff2E398F),
                      ),
              )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadiusSize),
              color: const Color(0xff2E398F),
            ),
      child: Material(
        borderRadius: BorderRadius.circular(borderRadiusSize),
        color: isFill
            ? (enabled ? buttonColor ?? const Color(0xff2E398F) : Colors.grey)
            : Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          highlightColor: Colors.transparent,
          onTap: (enabled && !isLoading) ? () => onTap() : null,
          child: Container(
            padding:
                pd ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: isLoading
                ? const Center(
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (prefix != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: prefix,
                        ),
                      Flexible(
                        child: widget ??
                            Text(
                              text,
                              maxLines: maxLines,
                              style: textStyle ??
                                  TextStyle(
                                    color: isFill
                                        ? (enabled ? Colors.white : Colors.grey)
                                        : (enabled
                                            ? const Color(0xff2E398F)
                                            : Colors.grey),
                                    fontSize: fontSize,
                                    fontWeight: fontWeight,
                                  ),
                            ),
                      ),
                      if (tail != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: tail,
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
