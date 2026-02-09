import 'package:film_ai/features/results/widgets/tmdb_link_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildSubject({
    String tmdbUrl = 'https://www.themoviedb.org/movie/27205-inception',
  }) {
    return MaterialApp(
      home: Scaffold(
        body: TmdbLinkButton(tmdbUrl: tmdbUrl),
      ),
    );
  }

  group('TmdbLinkButton', () {
    testWidgets('displays "Open in TMDB" label', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(find.text('Open in TMDB'), findsOneWidget);
    });

    testWidgets('displays an external-link icon', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(find.byIcon(Icons.open_in_new), findsOneWidget);
    });

    testWidgets('button is tappable', (tester) async {
      await tester.pumpWidget(buildSubject());

      // Verify the button exists and can receive taps without crashing.
      await tester.tap(find.byType(OutlinedButton));
      await tester.pump();
    });
  });
}
