import 'package:film_ai/features/results/models/movie_recommendation.dart';
import 'package:film_ai/features/results/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildSubject(MovieRecommendation movie) {
    return MaterialApp(
      home: Scaffold(body: MovieCard(movie: movie)),
    );
  }

  group('MovieCard', () {
    testWidgets('renders title, summary, and metadata', (tester) async {
      final movie = MovieRecommendation.dummyList.first;
      await tester.pumpWidget(buildSubject(movie));

      expect(find.text(movie.title), findsOneWidget);
      expect(find.textContaining('A skilled thief'), findsOneWidget);
      expect(find.text('Open in TMDB'), findsOneWidget);
      expect(find.text(movie.ageRating), findsOneWidget);
    });
  });
}
