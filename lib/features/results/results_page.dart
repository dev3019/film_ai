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

  void _onNewSearchPressed() {
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final carouselHeight = (constraints.maxHeight * 0.62)
                  .clamp(500.0, 560.0);

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 560,
                      minHeight: constraints.maxHeight - 24,
                    ),
                    child: Column(
                      children: [
                        const ResultsHeader(),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: carouselHeight,
                          child: MovieCarousel(
                            recommendations: widget.recommendations,
                            controller: _pageController,
                            onPageChanged: _onPageChanged,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 18),
                          child: PageIndicator(
                            count: widget.recommendations.length,
                            currentIndex: _currentPage,
                          ),
                        ),
                        _NewSearchButton(onPressed: _onNewSearchPressed),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _NewSearchButton extends StatelessWidget {
  const _NewSearchButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(28),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(28),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              border: _GradientBorder(
                gradient: AppColors.backgroundGradient,
                width: 1.5,
              ),
            ),
            child: ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.backgroundGradient.createShader(bounds),
              blendMode: BlendMode.srcIn,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 18),
                  SizedBox(width: 6),
                  Text(
                    'New Search',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientBorder extends BoxBorder {
  const _GradientBorder({required this.gradient, this.width = 1.0});

  final Gradient gradient;
  final double width;

  @override
  BorderSide get bottom => BorderSide.none;

  @override
  BorderSide get top => BorderSide.none;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

  @override
  bool get isUniform => true;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    final RRect rrect = borderRadius != null
        ? borderRadius.toRRect(rect).deflate(width / 2)
        : RRect.fromRectAndRadius(
            rect.deflate(width / 2),
            const Radius.circular(28),
          );

    canvas.drawRRect(rrect, paint);
  }

  @override
  ShapeBorder scale(double t) =>
      _GradientBorder(gradient: gradient, width: width * t);
}
