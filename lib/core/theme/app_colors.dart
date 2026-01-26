import 'package:flutter/material.dart';

/// Centralized color tokens for the app.
///
/// Task 1 scope: gradient + basic neutrals and accents used by the base UI.
abstract final class AppColors {
  static const Color coral = Color(0xFFFF6B6B);
  static const Color purple = Color(0xFF6C5CE7);

  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static const Color textPrimary = Color(0xFF101828);
  static const Color textSecondary = Color(0xFF667085);

  static const Color border = Color(0x1AFFFFFF); // white @ 10%

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[coral, purple],
  );
}
