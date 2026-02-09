import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/frosted_card.dart';
import '../models/movie_recommendation.dart';
import 'metadata_row.dart';
import 'movie_poster.dart';
import 'tmdb_link_button.dart';

/// A composite card that displays a complete movie recommendation.
///
/// Composes [MoviePoster], title, [MetadataRow], summary text, and
/// [TmdbLinkButton] inside a [FrostedCard].
class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.recommendation});

  /// The movie data to display.
  final MovieRecommendation recommendation;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return FrostedCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster image
          MoviePoster(posterUrl: recommendation.posterUrl),
          const SizedBox(height: 14),

          // Title
          Text(
            recommendation.title,
            style: textTheme.titleMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),

          // Rating + genres + age rating
          MetadataRow(
            rating: recommendation.rating,
            genres: recommendation.genres,
            ageRating: recommendation.ageRating,
          ),
          const SizedBox(height: 10),

          // Summary
          Text(
            recommendation.summary,
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 14),

          // TMDB link button — centered
          Center(child: TmdbLinkButton(tmdbUrl: recommendation.tmdbUrl)),
        ],
      ),
    );
  }
}
