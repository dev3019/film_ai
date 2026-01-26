import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'widgets/age_selector.dart';
import 'widgets/genre_dropdown.dart';
import 'widgets/mood_text_field.dart';

/// Task 1 scope: gradient background + header scaffold.
/// Task 2: Form controls (mood, genre, age) integrated.
/// Task 3/4 will add frosted card container and action buttons.
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Form state - will be used in Task 4 for form submission
  // ignore: unused_field
  String _mood = '';
  Genre? _selectedGenre;
  AgeCategory? _selectedAge;

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
                    _Header(),
                    const SizedBox(height: 22),
                    // Placeholder container (NOT frosted yet). Task 3 will replace
                    // this with a reusable frosted glass card.
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.border),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x22000000),
                            blurRadius: 24,
                            offset: Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Mood text field
                          MoodTextField(
                            onChanged: (value) => setState(() => _mood = value),
                          ),
                          const SizedBox(height: 20),
                          // Genre dropdown
                          GenreDropdown(
                            initialValue: _selectedGenre,
                            onChanged: (genre) =>
                                setState(() => _selectedGenre = genre),
                          ),
                          const SizedBox(height: 20),
                          // Age selector tiles
                          AgeSelector(
                            value: _selectedAge,
                            onChanged: (age) =>
                                setState(() => _selectedAge = age),
                          ),
                          const SizedBox(height: 24),
                          // Placeholder for action buttons (Task 3)
                          Text(
                            'Action buttons will be added in Task 3.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.7),
                              fontSize: 12,
                            ),
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
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.movie_creation_outlined, // clapboard-like icon
          color: Colors.white,
          size: 28,
        ),
        const SizedBox(width: 10),
        Text(
          'Film AI',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
