# Tasks (Phase 3) — UI: Results Page

## Scope
- Build the **Results Page UI** matching the provided design direction (gradient + frosted card + carousel).
- No backend, orchestration, AI, or TMDB integration yet (use dummy data for visual development).
- Navigation is allowed only between the Input page and Results page.

## Target Folder Additions
```text
lib/
├── features/
│   └── results/
│       ├── results_page.dart           # Main results page widget
│       ├── models/
│       │   └── movie_recommendation.dart  # Data model
│       └── widgets/
│           ├── results_header.dart      # Back button + "Your Picks"
│           ├── movie_poster.dart        # Network poster image
│           ├── metadata_row.dart        # Rating + genre chips + age chip
│           ├── tmdb_link_button.dart    # "Open in TMDB" button
│           ├── movie_card.dart          # Composite frosted card
│           ├── movie_carousel.dart      # Horizontal PageView
│           └── page_indicator.dart      # Dot indicators
└── (existing shared/widgets/frosted_card.dart reused)
```

## Task 1 — Data Model + Navigation + Page Scaffold
**Goal:** Establish navigation and the Results page container.

### Work items
- Create `lib/features/results/models/movie_recommendation.dart`
  - Fields: title, posterUrl, rating, genres (List), ageRating, summary, tmdbUrl.
- Add named-route navigation in `lib/main.dart`
  - InputPage -> ResultsPage and back.
- Create `lib/features/results/results_page.dart`
  - Scaffold with gradient background (reuse `AppColors.backgroundGradient`)
  - Accepts a `List<MovieRecommendation>` parameter.
- Wire the "Get Recommendations" handler in `InputPage`
  - Navigate to ResultsPage with dummy data.

### Acceptance criteria
- App can navigate from Input page to Results page and back without errors.
- Results page renders a gradient background and loads dummy data.

## Task 2 — Individual Movie Card Sub-widgets
**Goal:** Build reusable subcomponents for the movie card.

### Work items
- `lib/features/results/widgets/results_header.dart`
  - Back chevron + "Your Picks" title, white text, `Navigator.pop`.
- `lib/features/results/widgets/movie_poster.dart`
  - `Image.network` with rounded corners, loading placeholder, error fallback.
- `lib/features/results/widgets/metadata_row.dart`
  - Star icon + rating number
  - Genre chip(s) as small bordered tags
  - Age rating chip.
- `lib/features/results/widgets/tmdb_link_button.dart`
  - "Open in TMDB" button with external-link icon
  - Launches URL using `url_launcher`.

### Acceptance criteria
- Each widget is reusable and styled consistently with existing theme.
- Poster and button have safe loading/error states.

## Task 3 — Movie Card Composite + Carousel + Dots
**Goal:** Assemble the card and enable horizontal paging.

### Work items
- `lib/features/results/widgets/movie_card.dart`
  - Compose poster + title + metadata row + summary text + TMDB button inside `FrostedCard`.
- `lib/features/results/widgets/movie_carousel.dart`
  - `PageView.builder` with viewport fraction (approx 0.85) and peeked neighbors.
  - Exposes current-page callback for indicator sync.
- `lib/features/results/widgets/page_indicator.dart`
  - Row of dots with active state.

### Acceptance criteria
- Carousel scrolls horizontally with smooth paging.
- Dots stay in sync with the visible card.

## Task 4 — Assemble Page + "New Search" Button + Polish
**Goal:** Finish the full layout and match the reference image.

### Work items
- Add "New Search" button at the bottom of ResultsPage
  - Styled like outlined action button from Input page.
  - Navigates back to InputPage.
- Compose full ResultsPage layout: header + carousel + dots + new-search button.
- Responsive layout (SafeArea, padding, ConstrainedBox).

### Acceptance criteria
- Final Results page matches the intended layout.
- No runtime errors; UI stable across common device sizes.

## Existing assets to reuse
- `lib/shared/widgets/frosted_card.dart` — frosted glass container
- `lib/core/theme/app_colors.dart` — gradient colors, text colors
- `lib/core/theme/app_theme.dart` — ThemeData, button styles, typography
