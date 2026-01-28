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
    final double innerRadius = (borderRadius - 2).clamp(0.0, borderRadius);

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          width: double.infinity,
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
          child: Stack(
            children: [
              // Subtle inner "smoky" edge tint to match the mock.
              Positioned.fill(
                child: IgnorePointer(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(innerRadius),
                        border: Border.all(
                          color: Colors.black.withValues(alpha: 0.06),
                          width: 1,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Colors.black.withValues(alpha: 0.045),
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.02),
                          ],
                          stops: const <double>[0.0, 0.55, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: padding, child: child),
            ],
          ),
        ),
      ),
    );
  }
}
