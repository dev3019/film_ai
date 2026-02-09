import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'models/movie_recommendation.dart';
import 'widgets/movie_carousel.dart';
import 'widgets/page_indicator.dart';
import 'widgets/results_header.dart';

/// Main results page displaying movie recommendations.
///
/// Accepts a list of [MovieRecommendation] items and renders them over
/// the shared gradient background. Sub-widgets (carousel, cards, etc.)
/// will be composed here in subsequent tasks.
class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key, required this.recommendations});

  /// The movie recommendations to display.
  final List<MovieRecommendation> recommendations;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ResultsHeader(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: widget.recommendations.isEmpty
                      ? const Center(
                          child: Text(
                            'No recommendations available',
                            style: TextStyle(color: Colors.white70),
                          ),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: MovieCarousel(
                                recommendations: widget.recommendations,
                                onPageChanged: (index) {
                                  setState(() => _currentPage = index);
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            PageIndicator(
                              count: widget.recommendations.length,
                              currentIndex: _currentPage,
                            ),
                            const SizedBox(height: 16),
                          ],
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
