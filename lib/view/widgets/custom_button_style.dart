import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  final BuildContext ctx;

  CustomButtonStyles(this.ctx);

  // Outline button style
  BoxDecoration get outlineDecoration => BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: GradientBoxBorder(
      width: 1,
      gradient: LinearGradient(
        begin: Alignment(0.0, 0),
        end: Alignment(0.0, 1),
        colors: [Colors.white70, Colors.white70.withValues(alpha: 0)],
      ),
    ),
  );
  BoxDecoration get outlineColorDecoration => BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: GradientBoxBorder(
      width: 1,
      gradient: LinearGradient(
        begin: Alignment(0.0, 0),
        end: Alignment(0.0, 1),
        colors: [Color(0xFFA90808), Color(0xFFA90808).withValues(alpha: 0)],
      ),
    ),
  );

  // text button style
  ButtonStyle get none => ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    elevation: WidgetStateProperty.all<double>(0),
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
    side: WidgetStateProperty.all<BorderSide>(
      BorderSide(color: Colors.transparent),
    ),
  );
}
