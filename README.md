# Film AI

An AI-powered movie recommendation app built with Flutter. Describe your mood, pick a genre and age suitability, and get personalized film suggestions.

> **Note:** This is a UI-only project. There is no backend or AI service integrated yet -- all movie data shown is static/dummy. The backend and AI layers are planned for future phases.

## Screenshots

<p align="center">
  <img src="input_page.png" alt="Input Page" width="300" />
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="results_page.png" alt="Results Page" width="300" />
</p>

## Features

- **Personalized recommendations** -- Get movie suggestions tailored to your mood, preferred genre, and age suitability, presented in a swipeable carousel with poster, rating, genre chips, and plot summary
- **TMDB integration** -- Each recommendation includes a direct link to its TMDB page
- **Similar to Last Time** -- Re-fetch recommendations based on your previous preferences using local history (planned)

## Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **Platforms:** Android, iOS, Web

## Getting Started

1. Ensure you have [Flutter](https://docs.flutter.dev/get-started/install) installed.
2. Clone the repository and navigate to the project root.
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                        # App entry point and route configuration
├── core/theme/                      # App theme, colors, and gradients
├── features/
│   ├── input/                       # Input page and its widgets
│   │   ├── input_page.dart
│   │   └── widgets/                 # mood_text_field, genre_dropdown, age_selector, action_buttons
│   └── results/                     # Results page and its widgets
│       ├── results_page.dart
│       ├── models/                  # MovieRecommendation data model
│       └── widgets/                 # movie_card, movie_carousel, page_indicator
└── shared/widgets/                  # Reusable widgets (frosted_card, gradient_outlined_button)

docs/
├── High-Level.md                    # High-level design and requirements
├── Rules.md                         # Project rules and constraints
└── Tasks.md                         # Phase 3 task breakdown
```
