import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'models/movie_recommendation.dart';
import 'widgets/movie_carousel.dart';
import 'widgets/page_indicator.dart';
import 'widgets/results_header.dart';

/// Main results page displaying movie recommendations in a carousel.
///
/// Accepts a list of [MovieRecommendation] items and renders them as
/// horizontally paging cards with a synced dot indicator.
class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key, required this.recommendations});

  /// The movie recommendations to display.
  final List<MovieRecommendation> recommendations;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentPage = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              const ResultsHeader(),
              const SizedBox(height: 8),

              // Movie card carousel
              Expanded(
                child: MovieCarousel(
                  recommendations: widget.recommendations,
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                ),
              ),

              // Dot indicators
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: PageIndicator(
                  count: widget.recommendations.length,
                  currentIndex: _currentPage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
