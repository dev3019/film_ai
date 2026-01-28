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
          child: _PrimaryButton(
            label: 'Get Recommendations',
            icon: Icons.auto_fix_high,
            onPressed: onGetRecommendations,
          ),
        ),
        const SizedBox(width: 12),
        // Secondary button - Similar to Last Time
        Expanded(
          child: _SecondaryButton(
            label: 'Similar to Last Time',
            icon: Icons.history,
            onPressed: onSimilarToLastTime,
          ),
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    required this.label,
    required this.icon,
    this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.coral,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        elevation: 2,
      ),
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
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  const _SecondaryButton({
    required this.label,
    required this.icon,
    this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.coral,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        side: BorderSide(
          color: AppColors.coral.withValues(alpha: 0.6),
          width: 1.5,
        ),
      ),
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
    );
  }
}
