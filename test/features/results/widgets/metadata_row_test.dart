import 'package:film_ai/features/results/widgets/metadata_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildSubject({
    double rating = 8.4,
    List<String> genres = const ['Sci-Fi', 'Action'],
    String ageRating = 'PG-13',
  }) {
    return MaterialApp(
      home: Scaffold(
        body: MetadataRow(
          rating: rating,
          genres: genres,
          ageRating: ageRating,
        ),
      ),
    );
  }

  group('MetadataRow', () {
    testWidgets('displays a star icon', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('displays the rating value', (tester) async {
      await tester.pumpWidget(buildSubject(rating: 7.5));

      expect(find.text('7.5'), findsOneWidget);
    });

    testWidgets('displays all genre chips', (tester) async {
      await tester.pumpWidget(
        buildSubject(genres: ['Comedy', 'Drama', 'Adventure']),
      );

      expect(find.text('Comedy'), findsOneWidget);
      expect(find.text('Drama'), findsOneWidget);
      expect(find.text('Adventure'), findsOneWidget);
    });

    testWidgets('displays the age rating chip', (tester) async {
      await tester.pumpWidget(buildSubject(ageRating: 'R'));

      expect(find.text('R'), findsOneWidget);
    });

    testWidgets('handles empty genre list gracefully', (tester) async {
      await tester.pumpWidget(buildSubject(genres: []));

      // Should still show rating and age, no crash.
      expect(find.text('8.4'), findsOneWidget);
      expect(find.text('PG-13'), findsOneWidget);
    });
  });
}
