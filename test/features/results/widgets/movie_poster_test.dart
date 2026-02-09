import 'package:film_ai/features/results/widgets/movie_poster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildSubject({String posterUrl = 'https://example.com/poster.jpg'}) {
    return MaterialApp(
      home: Scaffold(
        body: MoviePoster(posterUrl: posterUrl),
      ),
    );
  }

  group('MoviePoster', () {
    testWidgets('renders Image.network with the given URL', (tester) async {
      await tester.pumpWidget(buildSubject());

      // Image.network creates an Image widget internally.
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('shows error fallback icon on load failure', (tester) async {
      await tester.pumpWidget(buildSubject(posterUrl: ''));
      // Trigger frame to process the error.
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.broken_image_outlined), findsOneWidget);
    });

    testWidgets('respects custom height and width', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MoviePoster(
              posterUrl: 'https://example.com/poster.jpg',
              height: 300,
              width: 200,
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.height, 300);
      expect(sizedBox.width, 200);
    });
  });
}
