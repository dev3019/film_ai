import 'package:flutter/material.dart';

import '../models/movie_recommendation.dart';
import 'movie_card.dart';

/// A horizontal paging carousel of [MovieCard] widgets.
///
/// Uses [PageView.builder] with a viewport fraction of ~0.85 so neighboring
/// cards peek from the edges. Reports the current page index via
/// [onPageChanged] for syncing external indicators.
class MovieCarousel extends StatelessWidget {
  const MovieCarousel({
    super.key,
    required this.recommendations,
    required this.controller,
    this.onPageChanged,
  });

  /// The list of movies to display.
  final List<MovieRecommendation> recommendations;

  /// Page controller for external coordination (e.g. dot indicator sync).
  final PageController controller;

  /// Called whenever the visible page changes.
  final ValueChanged<int>? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: recommendations.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: MovieCard(recommendation: recommendations[index]),
        );
      },
    );
  }
}
