import 'package:flutter/material.dart';

abstract class AppColors {
  /// Rich honey gold – primary branding color (more vibrant)
  static const Color primaryColor = Color(0xFFE89B1C);

  /// Light honey – backgrounds, subtle highlights
  static const Color lightPrimaryColor = Color(0xFFFFE7B5);

  /// Dark amber – for important accents/CTAs (better contrast)
  static const Color secondaryColor = Color(0xFFD87F08);

  /// Deep warm brown – headings/primary buttons
  static const Color darkBrown = Color(0xFF4E342E);

  /// Cream – clean background (warmer than pure white)
  static const Color background = Color(0xFFFDF5E6);

  /// Soft beige gray – subtle borders
  static const Color lightGray = Color(0xFFF5ECDF);

  /// Medium warm gray – secondary text/icons
  static const Color gray = Color(0xFF8D8D8D);

  /// Pure white – for contrast elements
  static const Color white = Color(0xFFFFFFFF);

  /// Error/alert color
  static const Color errorRed = Color(0xFFC62828);
}
