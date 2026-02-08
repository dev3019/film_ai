import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Action buttons for the input page.
///
/// Contains a primary "Get Recommendations" button and a secondary
/// "Similar to Last Time" button, styled per the design.
class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    this.onGetRecommendations,
    this.onSimilarToLastTime,
  });

  /// Callback when "Get Recommendations" is tapped.
  final VoidCallback? onGetRecommendations;

  /// Callback when "Similar to Last Time" is tapped.
  final VoidCallback? onSimilarToLastTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Primary button - Get Recommendations
        Expanded(
          child: _GradientFilledButton(
            label: 'Get Recommendations',
            icon: Icons.auto_fix_high,
            onPressed: onGetRecommendations,
          ),
        ),
        const SizedBox(width: 12),
        // Secondary button - Similar to Last Time
        Expanded(
          child: _GradientOutlinedButton(
            label: 'Similar to Last Time',
            icon: Icons.history,
            onPressed: onSimilarToLastTime,
          ),
        ),
      ],
    );
  }
}

class _GradientFilledButton extends StatelessWidget {
  const _GradientFilledButton({
    required this.label,
    required this.icon,
    this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(28),
      elevation: 2,
      child: Ink(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundGradient,
          borderRadius: BorderRadius.circular(28),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(28),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 18, color: Colors.white),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientOutlinedButton extends StatelessWidget {
  const _GradientOutlinedButton({
    required this.label,
    required this.icon,
    this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(28),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            // Gradient border
            border: _GradientBorder(
              gradient: AppColors.backgroundGradient,
              width: 1.5,
            ),
          ),
          child: ShaderMask(
            shaderCallback: (bounds) =>
                AppColors.backgroundGradient.createShader(bounds),
            blendMode: BlendMode.srcIn,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 18),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A custom border that paints a gradient stroke for buttons.
class _GradientBorder extends BoxBorder {
  const _GradientBorder({required this.gradient, this.width = 1.0});

  final Gradient gradient;
  final double width;

  @override
  BorderSide get bottom => BorderSide.none;

  @override
  BorderSide get top => BorderSide.none;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

  @override
  bool get isUniform => true;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    final RRect rrect = borderRadius != null
        ? borderRadius.toRRect(rect).deflate(width / 2)
        : RRect.fromRectAndRadius(
            rect.deflate(width / 2),
            const Radius.circular(28),
          );

    canvas.drawRRect(rrect, paint);
  }

  @override
  ShapeBorder scale(double t) =>
      _GradientBorder(gradient: gradient, width: width * t);
}
