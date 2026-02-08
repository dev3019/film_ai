import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../results/models/movie_recommendation.dart';
import '../results/results_page.dart';
import '../../shared/widgets/frosted_card.dart';
import 'widgets/action_buttons.dart';
import 'widgets/age_selector.dart';
import 'widgets/genre_dropdown.dart';
import 'widgets/mood_text_field.dart';

/// The main input page for Film AI.
///
/// Displays a gradient background with a frosted glass card containing:
/// - Mood text input
/// - Genre dropdown selector
/// - Age suitability tiles
/// - Action buttons for recommendations
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _mood = '';
  Genre? _selectedGenre;
  AgeCategory? _selectedAge;

  void _handleGetRecommendations() {
    // TODO: Wire to orchestrator in future phase
    debugPrint('Get Recommendations: mood=$_mood, genre=$_selectedGenre, age=$_selectedAge');
    final recommendations = <MovieRecommendation>[
      const MovieRecommendation(
        title: 'The Grand Skyline',
        posterUrl: 'https://example.com/posters/grand-skyline.jpg',
        rating: 8.3,
        genres: ['Drama', 'Romance'],
        ageRating: 'PG-13',
        summary:
            'A quiet architect finds connection and courage while restoring a landmark.',
        tmdbUrl: 'https://www.themoviedb.org/movie/10001',
      ),
      const MovieRecommendation(
        title: 'Starlight Circuit',
        posterUrl: 'https://example.com/posters/starlight-circuit.jpg',
        rating: 7.9,
        genres: ['Sci-Fi', 'Adventure'],
        ageRating: 'PG',
        summary:
            'A rookie pilot races to save her fleet from a mysterious cosmic threat.',
        tmdbUrl: 'https://www.themoviedb.org/movie/10002',
      ),
      const MovieRecommendation(
        title: 'Midnight Canvas',
        posterUrl: 'https://example.com/posters/midnight-canvas.jpg',
        rating: 8.1,
        genres: ['Mystery', 'Thriller'],
        ageRating: 'R',
        summary:
            'A detective unravels the secrets hidden within a series of surreal paintings.',
        tmdbUrl: 'https://www.themoviedb.org/movie/10003',
      ),
    ];

    Navigator.of(context).pushNamed(
      ResultsPage.routeName,
      arguments: recommendations,
    );
  }

  void _handleSimilarToLastTime() {
    // TODO: Wire to local history in future phase
    debugPrint('Similar to Last Time requested');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const _Header(),
                    const SizedBox(height: 22),
                    FrostedCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MoodTextField(
                            onChanged: (value) => setState(() => _mood = value),
                          ),
                          const SizedBox(height: 20),
                          GenreDropdown(
                            initialValue: _selectedGenre,
                            onChanged: (genre) =>
                                setState(() => _selectedGenre = genre),
                          ),
                          const SizedBox(height: 20),
                          AgeSelector(
                            value: _selectedAge,
                            onChanged: (age) =>
                                setState(() => _selectedAge = age),
                          ),
                          const SizedBox(height: 24),
                          ActionButtons(
                            onGetRecommendations: _handleGetRecommendations,
                            onSimilarToLastTime: _handleSimilarToLastTime,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.movie_creation, // filled clapboard icon
          color: Colors.white,
          size: 28,
        ),
        const SizedBox(width: 10),
        Text(
          'Film AI',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}
