import 'dart:ui';

import 'package:flutter/material.dart';

/// A reusable frosted glass card container.
///
/// Uses backdrop blur and semi-transparent background to create
/// a glass-like appearance over gradient backgrounds.
class FrostedCard extends StatelessWidget {
  const FrostedCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = 24.0,
    this.blurSigma = 12.0,
  });

  /// The content to display inside the card.
  final Widget child;

  /// Padding inside the card. Defaults to 20 on all sides.
  final EdgeInsetsGeometry padding;

  /// Border radius of the card. Defaults to 24.
  final double borderRadius;

  /// Blur intensity. Defaults to 12.
  final double blurSigma;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          width: double.infinity,
          padding: padding,
          decoration: BoxDecoration(
            // High opacity white for clean, readable frosted effect
            color: Colors.white.withValues(alpha: 0.92),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.5),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
