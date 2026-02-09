import 'package:film_ai/features/results/models/movie_recommendation.dart';
import 'package:film_ai/features/results/widgets/movie_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildSubject({
    required List<MovieRecommendation> movies,
    required ValueChanged<int> onPageChanged,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: 620,
          child: MovieCarousel(
            recommendations: movies,
            onPageChanged: onPageChanged,
          ),
        ),
      ),
    );
  }

  group('MovieCarousel', () {
    testWidgets('renders a page view for recommendations', (tester) async {
      await tester.pumpWidget(
        buildSubject(
          movies: MovieRecommendation.dummyList,
          onPageChanged: (_) {},
        ),
      );

      expect(find.byType(PageView), findsOneWidget);
      expect(
        find.text(MovieRecommendation.dummyList.first.title),
        findsOneWidget,
      );
    });

    testWidgets('invokes onPageChanged when swiping', (tester) async {
      var changedTo = -1;
      await tester.pumpWidget(
        buildSubject(
          movies: MovieRecommendation.dummyList,
          onPageChanged: (index) => changedTo = index,
        ),
      );

      await tester.drag(find.byType(PageView), const Offset(-400, 0));
      await tester.pumpAndSettle();

      expect(changedTo, 1);
    });
  });
}
