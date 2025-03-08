import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    required,
    this.width,
    this.height,
    required this.buttonStyle,
    required this.decoration,
    this.margin,
    this.textColor,
  });

  final BoxDecoration decoration;
  final ButtonStyle buttonStyle;
  final String text;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return _buildBtnOutline;
  }

  Widget get _buildBtnOutline => Container(
    height: height ?? 40,
    width: width ?? double.maxFinite,
    margin: margin,
    decoration: decoration,
    alignment: Alignment.center,
    child: OutlinedButton(
      style: buttonStyle,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor ?? Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
