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
          child: _GradientActionButton(
            label: 'Get Recommendations',
            icon: Icons.auto_fix_high,
            onPressed: onGetRecommendations,
          ),
        ),
        const SizedBox(width: 12),
        // Secondary button - Similar to Last Time
        Expanded(
          child: _GradientActionButton(
            label: 'Similar to Last Time',
            icon: Icons.history,
            onPressed: onSimilarToLastTime,
          ),
        ),
      ],
    );
  }
}

class _GradientActionButton extends StatelessWidget {
  const _GradientActionButton({
    required this.label,
    required this.icon,
    this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    const double radius = 28;
    final bool enabled = onPressed != null;

    final LinearGradient gradient = enabled
        ? AppColors.backgroundGradient
        : LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              AppColors.coral.withValues(alpha: 0.35),
              AppColors.purple.withValues(alpha: 0.35),
            ],
          );

    final Color foreground = enabled
        ? Colors.white
        : Colors.white.withValues(alpha: 0.75);

    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: enabled
              ? [
                  BoxShadow(
                    color: AppColors.purple.withValues(alpha: 0.25),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(radius),
          clipBehavior: Clip.antiAlias,
          child: Ink(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: InkWell(
              onTap: onPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 18, color: foreground),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        label,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: foreground,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
