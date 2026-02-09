import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// A row displaying a movie's rating, genre tags, and age rating.
///
/// Wraps content so genre chips flow to the next line on narrow screens.
class MetadataRow extends StatelessWidget {
  const MetadataRow({
    super.key,
    required this.rating,
    required this.genres,
    required this.ageRating,
  });

  /// Average rating (0.0 – 10.0).
  final double rating;

  /// Genre tags (e.g. ["Sci-Fi", "Action"]).
  final List<String> genres;

  /// Age suitability label (e.g. "PG-13").
  final String ageRating;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Wrap(
      spacing: 8,
      runSpacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        // Star rating
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const SizedBox(width: 3),
            Text(
              rating.toStringAsFixed(1),
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        // Genre chips
        for (final genre in genres) _GenreChip(label: genre),
        // Age rating chip
        _AgeChip(label: ageRating),
      ],
    );
  }
}

/// Small bordered tag for a genre label.
class _GenreChip extends StatelessWidget {
  const _GenreChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.textSecondary.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
      ),
    );
  }
}

/// Filled chip for the age rating label.
class _AgeChip extends StatelessWidget {
  const _AgeChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.purple.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.purple,
            ),
      ),
    );
  }
}
