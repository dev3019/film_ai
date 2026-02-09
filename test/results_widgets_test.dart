import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:film_ai/features/results/widgets/metadata_row.dart';
import 'package:film_ai/features/results/widgets/results_header.dart';
import 'package:film_ai/features/results/widgets/tmdb_link_button.dart';

void main() {
  testWidgets('ResultsHeader shows title and back icon', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ResultsHeader(),
        ),
      ),
    );

    expect(find.text('Your Picks'), findsOneWidget);
    expect(find.byIcon(Icons.chevron_left), findsOneWidget);
  });

  testWidgets('MetadataRow shows rating and chips', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MetadataRow(
            rating: 8.5,
            genres: ['Sci-Fi', 'Action'],
            ageRating: 'PG-13',
          ),
        ),
      ),
    );

    expect(find.text('8.5'), findsOneWidget);
    expect(find.text('Sci-Fi'), findsOneWidget);
    expect(find.text('Action'), findsOneWidget);
    expect(find.text('PG-13'), findsOneWidget);
  });

  testWidgets('TmdbLinkButton renders label and icon', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TmdbLinkButton(
            tmdbUrl: 'https://www.themoviedb.org/movie/27205-inception',
          ),
        ),
      ),
    );

    expect(find.text('Open in TMDB'), findsOneWidget);
    expect(find.byIcon(Icons.open_in_new), findsOneWidget);
  });
}
