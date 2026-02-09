import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'models/movie_recommendation.dart';

/// Main results page displaying movie recommendations.
///
/// Accepts a list of [MovieRecommendation] items and renders them over
/// the shared gradient background. Sub-widgets (carousel, cards, etc.)
/// will be composed here in subsequent tasks.
class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.recommendations});

  /// The movie recommendations to display.
  final List<MovieRecommendation> recommendations;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Minimal back button + title — full header widget in Task 2.
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left, color: Colors.white),
                      iconSize: 28,
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Your Picks',
                      style: textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // Placeholder content proving the page loads dummy data.
              Expanded(
                child: Center(
                  child: Text(
                    '${recommendations.length} recommendations loaded',
                    style: textTheme.titleMedium?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
