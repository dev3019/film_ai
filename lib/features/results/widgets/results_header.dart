import 'package:flutter/material.dart';

/// Header row for the Results page.
///
/// Displays a back chevron and a centered "Your Picks" title.
class ResultsHeader extends StatelessWidget {
  const ResultsHeader({super.key, this.onBack});

  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: SizedBox(
        height: 48,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.chevron_left, color: Colors.white),
                iconSize: 28,
                tooltip: 'Back',
                onPressed: onBack ?? () => Navigator.pop(context),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Your Picks',
                style: textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
