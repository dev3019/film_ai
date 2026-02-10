import 'package:film_ai/features/input/input_page.dart';
import 'package:film_ai/features/results/models/movie_recommendation.dart';
import 'package:film_ai/features/results/results_page.dart';
import 'package:film_ai/features/results/widgets/movie_carousel.dart';
import 'package:film_ai/features/results/widgets/page_indicator.dart';
import 'package:film_ai/features/results/widgets/results_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _buildSubject() {
  return MaterialApp(
    routes: <String, WidgetBuilder>{
      '/': (_) => const InputPage(),
      '/results': (_) =>
          ResultsPage(recommendations: MovieRecommendation.dummyList),
    },
    initialRoute: '/results',
  );
}

void main() {
  group('ResultsPage', () {
    testWidgets('renders header, carousel, indicator, and new search button', (
      tester,
    ) async {
      await tester.pumpWidget(_buildSubject());
      await tester.pumpAndSettle();

      expect(find.byType(ResultsHeader), findsOneWidget);
      expect(find.byType(MovieCarousel), findsOneWidget);
      expect(find.byType(PageIndicator), findsOneWidget);
      expect(find.text('New Search'), findsOneWidget);
    });

    testWidgets('new search button navigates back to InputPage', (tester) async {
      await tester.pumpWidget(_buildSubject());
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('New Search'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('New Search'));
      await tester.pumpAndSettle();

      expect(find.text('Film AI'), findsOneWidget);
      expect(find.byType(InputPage), findsOneWidget);
      expect(find.byType(ResultsPage), findsNothing);
    });

    testWidgets('layout stays stable on narrow width', (tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(_buildSubject());
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      expect(find.text('New Search'), findsOneWidget);
    });
  });
}
