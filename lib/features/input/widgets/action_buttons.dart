import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/gradient_outlined_button.dart';

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
          child: GradientOutlinedButton(
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
