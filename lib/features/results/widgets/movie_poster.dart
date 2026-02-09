import 'package:flutter/material.dart';

/// Displays a movie poster image loaded from a network URL.
///
/// Shows a loading indicator while the image is being fetched and a
/// fallback icon when the load fails.
class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.posterUrl,
    this.height = 220,
    this.width = double.infinity,
    this.borderRadius = 12.0,
  });

  /// Network URL for the poster image.
  final String posterUrl;

  /// Height of the poster container. Defaults to 220.
  final double height;

  /// Width of the poster container. Defaults to full width.
  final double width;

  /// Corner radius. Defaults to 12.
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: height,
        width: width,
        child: Image.network(
          posterUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return _Placeholder(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
                strokeWidth: 2,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return _Placeholder(
              child: Icon(
                Icons.broken_image_outlined,
                size: 48,
                color: Colors.grey.shade400,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      alignment: Alignment.center,
      child: child,
    );
  }
}
