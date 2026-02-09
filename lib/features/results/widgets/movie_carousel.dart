import 'package:flutter/material.dart';

import '../models/movie_recommendation.dart';
import 'movie_card.dart';

/// Horizontal pager for recommendation cards.
class MovieCarousel extends StatefulWidget {
  const MovieCarousel({
    super.key,
    required this.recommendations,
    required this.onPageChanged,
  });

  final List<MovieRecommendation> recommendations;
  final ValueChanged<int> onPageChanged;

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late final PageController _pageController;

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

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.recommendations.length,
      onPageChanged: widget.onPageChanged,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: MovieCard(movie: widget.recommendations[index]),
        );
      },
    );
  }
}
