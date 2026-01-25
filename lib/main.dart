import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/input/input_page.dart';

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
    );
  }
}
