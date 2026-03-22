import 'package:flutter/material.dart';

class AppColors {
  // Background
  static const scaffoldBg = Color(0xFF060914);
  static const cardActive = Color(0xFF1A1D3A);
  static const cardInactive = Color(0xFF0E1128);

  // Brand
  static const primary = Color(0xFF7C4DFF);
  static const primaryLight = Color(0xFFAB82FF);
  static const accent = Color(0xFFEB1555);
  static const accentGlow = Color(0x40EB1555);

  // Text
  static const textPrimary = Colors.white;
  static const textSecondary = Color(0xFF8D8E98);
  static const textResult = Color(0xFF24D876);

  // Gradient
  static const gradientStart = Color(0xFF7C4DFF);
  static const gradientEnd = Color(0xFFEB1555);

  static const Gradient brandGradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient cardGradient = LinearGradient(
    colors: [Color(0xFF1A1D3A), Color(0xFF12152D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
