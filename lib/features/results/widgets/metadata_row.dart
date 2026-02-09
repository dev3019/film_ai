import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Rating + genre tags + age rating row for a movie card.
class MetadataRow extends StatelessWidget {
  const MetadataRow({
    super.key,
    required this.rating,
    required this.genres,
    required this.ageRating,
  });

  final double rating;
  final List<String> genres;
  final String ageRating;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ratingStyle = textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    );

    return Wrap(
      spacing: 8,
      runSpacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, size: 16, color: Colors.amber),
            const SizedBox(width: 4),
            Text(rating.toStringAsFixed(1), style: ratingStyle),
          ],
        ),
        for (final genre in genres) _MetadataChip(label: genre),
        _MetadataChip(label: ageRating, isEmphasis: true),
      ],
    );
  }
}

class _MetadataChip extends StatelessWidget {
  const _MetadataChip({
    required this.label,
    this.isEmphasis = false,
  });

  final String label;
  final bool isEmphasis;

  @override
  Widget build(BuildContext context) {
    final Color borderColor = isEmphasis
        ? AppColors.coral.withValues(alpha: 0.6)
        : AppColors.textSecondary.withValues(alpha: 0.35);
    final Color textColor = isEmphasis ? AppColors.coral : AppColors.textSecondary;
    final Color backgroundColor =
        isEmphasis ? AppColors.coral.withValues(alpha: 0.1) : Colors.transparent;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
