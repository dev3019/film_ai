import 'package:film_ai/features/results/models/movie_recommendation.dart';
import 'package:film_ai/features/results/results_page.dart';
import 'package:film_ai/features/results/widgets/movie_carousel.dart';
import 'package:film_ai/features/results/widgets/page_indicator.dart';
import 'package:film_ai/features/results/widgets/results_header.dart';
import 'package:film_ai/shared/widgets/gradient_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final _movies = MovieRecommendation.dummyList;

Widget buildSubject({List<MovieRecommendation>? recommendations}) {
  return MaterialApp(
    home: ResultsPage(recommendations: recommendations ?? _movies),
  );
}

/// Set the test viewport to a size large enough to avoid overflow.
void useWideViewport(WidgetTester tester) {
  tester.view.physicalSize = const Size(1200, 1200);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

void main() {
  group('ResultsPage', () {
    testWidgets('renders ResultsHeader', (tester) async {
      useWideViewport(tester);
      await tester.pumpWidget(buildSubject());
      expect(find.byType(ResultsHeader), findsOneWidget);
    });

    testWidgets('renders MovieCarousel', (tester) async {
      useWideViewport(tester);
      await tester.pumpWidget(buildSubject());
      expect(find.byType(MovieCarousel), findsOneWidget);
    });

    testWidgets('renders PageIndicator', (tester) async {
      useWideViewport(tester);
      await tester.pumpWidget(buildSubject());
      expect(find.byType(PageIndicator), findsOneWidget);
    });

    testWidgets('renders New Search button', (tester) async {
      useWideViewport(tester);
      await tester.pumpWidget(buildSubject());
      expect(find.byType(GradientOutlinedButton), findsOneWidget);
      expect(find.text('New Search'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('New Search button triggers Navigator.pop', (tester) async {
      useWideViewport(tester);
      var didPop = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => ResultsPage(recommendations: _movies),
                    ),
                  );
                },
                child: const Text('Go'),
              ),
            ),
          ),
          navigatorObservers: [_PopObserver(() => didPop = true)],
        ),
      );

      // Navigate to the results page.
      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      // Tap the New Search button.
      await tester.tap(find.text('New Search'));
      await tester.pumpAndSettle();

      expect(didPop, isTrue);
    });

    testWidgets('wraps content in a ConstrainedBox with maxWidth 600',
        (tester) async {
      useWideViewport(tester);
      await tester.pumpWidget(buildSubject());

      // Find the ConstrainedBox that limits the content width to 600.
      final boxes = tester.widgetList<ConstrainedBox>(
        find.byType(ConstrainedBox),
      );
      final match = boxes.where(
        (box) => box.constraints.maxWidth == 600,
      );
      expect(match, isNotEmpty);
    });
  });
}

class _PopObserver extends NavigatorObserver {
  _PopObserver(this.onPop);

  final VoidCallback onPop;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onPop();
  }
}
