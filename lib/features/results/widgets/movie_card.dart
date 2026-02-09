import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/frosted_card.dart';
import '../models/movie_recommendation.dart';
import 'metadata_row.dart';
import 'movie_poster.dart';
import 'tmdb_link_button.dart';

/// Composite frosted card for a single movie recommendation.
class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final MovieRecommendation movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return FrostedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviePoster(posterUrl: movie.posterUrl, height: 230),
          const SizedBox(height: 16),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium?.copyWith(
              fontSize: 20,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          MetadataRow(
            rating: movie.rating,
            genres: movie.genres,
            ageRating: movie.ageRating,
          ),
          const SizedBox(height: 14),
          Text(
            movie.summary,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          TmdbLinkButton(tmdbUrl: movie.tmdbUrl),
        ],
      ),
    );
  }
}
