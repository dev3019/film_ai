/// Data model representing a single movie recommendation.
///
/// Used by the Results page to display AI-generated movie suggestions.
/// All fields are required and immutable.
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

  /// Movie title.
  final String title;

  /// URL to a poster image (TMDB or placeholder).
  final String posterUrl;

  /// Average rating (0.0 – 10.0).
  final double rating;

  /// Genre tags associated with the movie.
  final List<String> genres;

  /// Age suitability label (e.g. "PG-13", "R").
  final String ageRating;

  /// Brief synopsis or AI-generated summary.
  final String summary;

  /// Link to the movie's TMDB page.
  final String tmdbUrl;

  /// Hardcoded dummy entries for visual development.
  static List<MovieRecommendation> get dummyList => const <MovieRecommendation>[
    MovieRecommendation(
      title: 'Inception',
      posterUrl: 'https://image.tmdb.org/t/p/w500/oYuLEt3zVCKq57qu2F8dT7NIa6f.jpg',
      rating: 8.4,
      genres: <String>['Sci-Fi', 'Action', 'Thriller'],
      ageRating: 'PG-13',
      summary:
          'A skilled thief who steals corporate secrets through dream-sharing '
          'technology is given the inverse task of planting an idea into the '
          "mind of a C.E.O.",
      tmdbUrl: 'https://www.themoviedb.org/movie/27205-inception',
    ),
    MovieRecommendation(
      title: 'The Grand Budapest Hotel',
      posterUrl: 'https://image.tmdb.org/t/p/w500/eWdyYQreja6JGCzqHWXpWHDrrPo.jpg',
      rating: 8.1,
      genres: <String>['Comedy', 'Drama', 'Adventure'],
      ageRating: 'R',
      summary:
          'A writer encounters the owner of an aging high-class hotel, who '
          'tells him of his early years serving as a lobby boy in the hotel\'s '
          'glorious years under an exceptional concierge.',
      tmdbUrl: 'https://www.themoviedb.org/movie/120467-the-grand-budapest-hotel',
    ),
    MovieRecommendation(
      title: 'Spider-Man: Into the Spider-Verse',
      posterUrl: 'https://image.tmdb.org/t/p/w500/iiZZdoQBEYBv6id8su7ImL0oCbD.jpg',
      rating: 8.4,
      genres: <String>['Animation', 'Action', 'Sci-Fi'],
      ageRating: 'PG',
      summary:
          'Teen Miles Morales becomes the Spider-Man of his reality and crosses '
          'paths with counterparts from other dimensions to stop a threat to '
          'all realities.',
      tmdbUrl: 'https://www.themoviedb.org/movie/324857-spider-man-into-the-spider-verse',
    ),
    MovieRecommendation(
      title: 'Parasite',
      posterUrl: 'https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg',
      rating: 8.5,
      genres: <String>['Thriller', 'Drama', 'Comedy'],
      ageRating: 'R',
      summary:
          'Greed and class discrimination threaten the newly formed symbiotic '
          'relationship between the wealthy Park family and the destitute Kim '
          'clan.',
      tmdbUrl: 'https://www.themoviedb.org/movie/496243-parasite',
    ),
  ];
}
