import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';

/// A button that opens the given TMDB URL in an external browser.
///
/// Displays an "Open in TMDB" label with an external-link icon.
/// Gracefully handles launch failures with a snackbar message.
class TmdbLinkButton extends StatelessWidget {
  const TmdbLinkButton({super.key, required this.tmdbUrl});

  /// The TMDB page URL to open.
  final String tmdbUrl;

  Future<void> _launchUrl(BuildContext context) async {
    final uri = Uri.tryParse(tmdbUrl);
    if (uri == null) {
      _showError(context);
      return;
    }

    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched && context.mounted) {
      _showError(context);
    }
  }

  void _showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Could not open TMDB link')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => _launchUrl(context),
      icon: const Icon(Icons.open_in_new, size: 16),
      label: const Text('Open in TMDB'),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.purple,
        side: BorderSide(color: AppColors.purple.withValues(alpha: 0.4)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }
}
