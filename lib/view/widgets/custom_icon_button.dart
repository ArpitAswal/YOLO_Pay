import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get whiteOutline => BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(28),
    border: GradientBoxBorder(
      width: 1,
      gradient: LinearGradient(
        begin: Alignment(0.0, 0),
        end: Alignment(0.0, 1),
        colors: [
          Colors.white.withValues(alpha: 0.2),
          Colors.white70.withValues(alpha: 0.2),
        ],
      ),
    ),
  );

  static BoxDecoration get redOutline => BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(28),
    border: GradientBoxBorder(
      width: 1,
      gradient: LinearGradient(
        begin: Alignment(0.0, 0),
        end: Alignment(0.0, 1),
        colors: [
          Color(0xFFA90808).withValues(alpha: 0.2),
          Colors.red.shade600.withValues(alpha: 0.2),
        ],
      ),
    ),
  );
  static BoxDecoration get none => BoxDecoration();
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.alignment,
    this.height,
    this.width,
    required this.decoration,
    this.padding,
    this.onTap,
    required this.child,
  });

  final Alignment? alignment;

  final double? height;

  final double? width;

  final BoxDecoration decoration;

  final EdgeInsetsGeometry? padding;

  final VoidCallback? onTap;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
    height: height ?? 0,
    width: width ?? 0,
    child: DecoratedBox(
      decoration: decoration,
      child: IconButton(
        padding: padding ?? EdgeInsets.zero,
        onPressed: onTap,
        icon: child,
      ),
    ),
  );
}
