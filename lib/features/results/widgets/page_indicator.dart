import 'package:flutter/material.dart';

/// A row of dot indicators showing carousel position.
///
/// The active dot is highlighted; inactive dots are dimmed. The active
/// index is controlled externally via [currentIndex].
class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    this.activeColor = Colors.white,
    this.inactiveColor,
    this.dotSize = 8.0,
    this.spacing = 6.0,
  });

  /// Total number of pages.
  final int count;

  /// Zero-based index of the currently active page.
  final int currentIndex;

  /// Color of the active dot.
  final Color activeColor;

  /// Color of inactive dots. Defaults to [activeColor] at 35% opacity.
  final Color? inactiveColor;

  /// Diameter of each dot.
  final double dotSize;

  /// Horizontal spacing between dots.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final dimColor =
        inactiveColor ?? activeColor.withValues(alpha: 0.35);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(count, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: isActive ? dotSize * 2.2 : dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: isActive ? activeColor : dimColor,
            borderRadius: BorderRadius.circular(dotSize / 2),
          ),
        );
      }),
    );
  }
}
