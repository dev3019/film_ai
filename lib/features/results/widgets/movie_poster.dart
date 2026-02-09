import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Poster image widget for a movie recommendation.
class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.posterUrl,
    this.borderRadius = 16,
    this.aspectRatio = 2 / 3,
    this.fit = BoxFit.cover,
  });

  final String posterUrl;
  final double borderRadius;
  final double aspectRatio;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Image.network(
          posterUrl,
          fit: fit,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return const _PosterPlaceholder(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.textSecondary,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const _PosterPlaceholder(
              icon: Icons.broken_image_outlined,
            );
          },
        ),
      ),
    );
  }
}

class _PosterPlaceholder extends StatelessWidget {
  const _PosterPlaceholder({this.child, this.icon = Icons.movie_outlined});

  final Widget? child;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      alignment: Alignment.center,
      child: child ??
          Icon(
            icon,
            color: AppColors.textSecondary,
            size: 28,
          ),
    );
  }
}
