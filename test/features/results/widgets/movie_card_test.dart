import 'package:film_ai/features/results/models/movie_recommendation.dart';
import 'package:film_ai/features/results/widgets/metadata_row.dart';
import 'package:film_ai/features/results/widgets/movie_card.dart';
import 'package:film_ai/features/results/widgets/movie_poster.dart';
import 'package:film_ai/features/results/widgets/tmdb_link_button.dart';
import 'package:film_ai/shared/widgets/frosted_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const _movie = MovieRecommendation(
  title: 'Test Movie',
  posterUrl: 'https://example.com/poster.jpg',
  rating: 7.5,
  genres: <String>['Action', 'Drama'],
  ageRating: 'PG-13',
  summary: 'A test summary for the movie card widget.',
  tmdbUrl: 'https://www.themoviedb.org/movie/0-test',
);

Widget buildSubject({MovieRecommendation recommendation = _movie}) {
  return MaterialApp(
    home: Scaffold(
      body: SingleChildScrollView(
        child: MovieCard(recommendation: recommendation),
      ),
    ),
  );
}

void main() {
  group('MovieCard', () {
    testWidgets('renders inside a FrostedCard', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.byType(FrostedCard), findsOneWidget);
    });

    testWidgets('displays movie title', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.text('Test Movie'), findsOneWidget);
    });

    testWidgets('contains a MoviePoster', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.byType(MoviePoster), findsOneWidget);
    });

    testWidgets('contains a MetadataRow', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.byType(MetadataRow), findsOneWidget);
    });

    testWidgets('displays summary text', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(
        find.text('A test summary for the movie card widget.'),
        findsOneWidget,
      );
    });

    testWidgets('contains a TmdbLinkButton', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.byType(TmdbLinkButton), findsOneWidget);
    });
  });
}
