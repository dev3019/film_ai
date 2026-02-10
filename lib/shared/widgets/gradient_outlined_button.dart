import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// A button with a gradient border and gradient-tinted content.
///
/// Displays an [icon] and [label] in a row, masked with
/// [AppColors.backgroundGradient]. The border uses a custom [GradientBorder]
/// to paint a gradient stroke around the rounded rectangle.
class GradientOutlinedButton extends StatelessWidget {
  const GradientOutlinedButton({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
  });

  /// Button text.
  final String label;

  /// Leading icon.
  final IconData icon;

  /// Callback when the button is tapped.
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
            border: GradientBorder(
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

/// A custom border that paints a gradient stroke.
///
/// Used by [GradientOutlinedButton] to render a coral-to-purple gradient
/// border around the button shape.
class GradientBorder extends BoxBorder {
  const GradientBorder({required this.gradient, this.width = 1.0});

  /// The gradient used for the stroke paint.
  final Gradient gradient;

  /// Stroke width of the border.
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
      GradientBorder(gradient: gradient, width: width * t);
}
