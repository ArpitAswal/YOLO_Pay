import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomImageView extends StatelessWidget {
  final double height;

  final double width;

  final String imgPath;

  final Color? iconColor;

  final Color? borderColor;

  final double? borderRadius;

  const CustomImageView({
    super.key,
    required this.height,
    required this.width,
    required this.imgPath,
    this.iconColor,
    this.borderColor,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return _buildButton();
  }

  Widget _buildButton() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
        color: Colors.transparent,
        border: Border.all(color: borderColor ?? Colors.transparent),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        imgPath,
        height: 20,
        width: 20,
        fit: BoxFit.contain,
        colorFilter:
            (iconColor != null)
                ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                : null,
      ),
    );
  }
}
