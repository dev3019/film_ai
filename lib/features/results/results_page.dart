import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'models/movie_recommendation.dart';
import 'widgets/results_header.dart';

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
              const ResultsHeader(),
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
