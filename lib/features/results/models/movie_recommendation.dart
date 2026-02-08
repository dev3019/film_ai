class MovieRecommendation {
  const MovieRecommendation({
    required this.title,
    required this.posterUrl,
    required this.rating,
    required this.genres,
    required this.ageRating,
    required this.summary,
    required this.tmdbUrl,
  });

  final String title;
  final String posterUrl;
  final double rating;
  final List<String> genres;
  final String ageRating;
  final String summary;
  final String tmdbUrl;
}
