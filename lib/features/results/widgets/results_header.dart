import 'package:flutter/material.dart';

/// Header bar for the Results page.
///
/// Renders a centered "Your Picks" title with a left-aligned back chevron
/// that calls [Navigator.pop].
class ResultsHeader extends StatelessWidget {
  const ResultsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.white),
              iconSize: 28,
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Text(
            'Your Picks',
            style: textTheme.headlineLarge?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
