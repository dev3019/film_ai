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
      initialRoute: '/',
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const InputPage(),
        );
      case '/results':
        final recommendations =
            settings.arguments as List<MovieRecommendation>? ?? [];
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) =>
              ResultsPage(recommendations: recommendations),
        );
      default:
        return null;
    }
  }
}
