import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/input/input_page.dart';
import 'features/results/models/movie_recommendation.dart';
import 'features/results/results_page.dart';

void main() {
  runApp(const FilmAiApp());
}

class FilmAiApp extends StatelessWidget {
  const FilmAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const InputPage(),
      onGenerateRoute: (settings) {
        if (settings.name == ResultsPage.routeName) {
          final args = settings.arguments;
          if (args is List<MovieRecommendation>) {
            return MaterialPageRoute(
              builder: (_) => ResultsPage(recommendations: args),
            );
          }
          return MaterialPageRoute(
            builder: (_) => const _InvalidRoutePage(),
          );
        }
        return null;
      },
      onUnknownRoute: (_) => MaterialPageRoute(
        builder: (_) => const _InvalidRoutePage(),
      ),
    );
  }
}

class _InvalidRoutePage extends StatelessWidget {
  const _InvalidRoutePage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Route not found'),
      ),
    );
  }
}
