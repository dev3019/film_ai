import 'package:film_ai/features/results/models/movie_recommendation.dart';
import 'package:film_ai/features/results/widgets/movie_card.dart';
import 'package:film_ai/features/results/widgets/movie_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final _movies = MovieRecommendation.dummyList;

Widget buildSubject({
  required PageController controller,
  ValueChanged<int>? onPageChanged,
}) {
  return MaterialApp(
    home: Scaffold(
      body: SizedBox(
        height: 600,
        child: MovieCarousel(
          recommendations: _movies,
          controller: controller,
          onPageChanged: onPageChanged,
        ),
      ),
    ),
  );
}

void main() {
  group('MovieCarousel', () {
    testWidgets('renders a PageView', (tester) async {
      final controller = PageController(viewportFraction: 0.85);
      addTearDown(controller.dispose);

      await tester.pumpWidget(buildSubject(controller: controller));
      expect(find.byType(PageView), findsOneWidget);
    });

    testWidgets('displays a MovieCard for the first item', (tester) async {
      final controller = PageController(viewportFraction: 0.85);
      addTearDown(controller.dispose);

      await tester.pumpWidget(buildSubject(controller: controller));
      // At least the first card should be rendered.
      expect(find.byType(MovieCard), findsWidgets);
    });

    testWidgets('invokes onPageChanged on swipe', (tester) async {
      int? reportedPage;
      final controller = PageController(viewportFraction: 0.85);
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        buildSubject(
          controller: controller,
          onPageChanged: (index) => reportedPage = index,
        ),
      );

      // Swipe left to go to the next page.
      await tester.fling(find.byType(PageView), const Offset(-300, 0), 800);
      await tester.pumpAndSettle();

      expect(reportedPage, isNotNull);
      expect(reportedPage, greaterThan(0));
    });
  });
}
