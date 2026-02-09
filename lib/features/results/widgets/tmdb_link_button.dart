import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';

/// Button that opens the movie's TMDB page.
class TmdbLinkButton extends StatelessWidget {
  const TmdbLinkButton({
    super.key,
    required this.tmdbUrl,
  });

  final String tmdbUrl;

  Future<void> _openLink() async {
    final uri = Uri.tryParse(tmdbUrl);
    if (uri == null) {
      debugPrint('TMDB link is invalid: $tmdbUrl');
      return;
    }

    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
    if (!launched) {
      debugPrint('Unable to launch TMDB link: $tmdbUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(22),
      elevation: 1,
      child: Ink(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundGradient,
          borderRadius: BorderRadius.circular(22),
        ),
        child: InkWell(
          onTap: _openLink,
          borderRadius: BorderRadius.circular(22),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Open in TMDB',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.open_in_new, size: 16, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
