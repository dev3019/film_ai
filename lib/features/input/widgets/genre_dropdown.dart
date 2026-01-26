import 'package:flutter/material.dart';

/// Available genre options for movie recommendations.
enum Genre {
  actionAdventure('Action & Adventure'),
  comedy('Comedy'),
  drama('Drama'),
  sciFi('Sci-Fi'),
  thriller('Thriller'),
  romance('Romance');

  const Genre(this.label);

  /// Display label for the genre.
  final String label;
}

/// A dropdown selector for choosing a movie genre.
///
/// Features:
/// - Styled to match theme with rounded corners and subtle borders
/// - Type-safe genre selection via [Genre] enum
class GenreDropdown extends StatefulWidget {
  const GenreDropdown({
    super.key,
    this.initialValue,
    this.onChanged,
  });

  /// Initial value for the dropdown.
  final Genre? initialValue;

  /// Callback when a genre is selected.
  final ValueChanged<Genre?>? onChanged;

  @override
  State<GenreDropdown> createState() => _GenreDropdownState();
}

class _GenreDropdownState extends State<GenreDropdown> {
  Genre? _selectedGenre;

  @override
  void initState() {
    super.initState();
    _selectedGenre = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Genre',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.black87,
              ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<Genre>(
          initialValue: _selectedGenre,
          hint: const Text('Select genre'),
          isExpanded: true,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
          items: Genre.values.map((genre) {
            return DropdownMenuItem<Genre>(
              value: genre,
              child: Text(genre.label),
            );
          }).toList(),
          onChanged: (genre) {
            setState(() => _selectedGenre = genre);
            widget.onChanged?.call(genre);
          },
        ),
      ],
    );
  }
}
