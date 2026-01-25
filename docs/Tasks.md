# Tasks (Phase 3) — UI: Input Page

## Scope
- Build the **Input Page UI** matching the provided design direction (gradient + frosted card) and **remove the phone/mock device background**.
- No backend, orchestration, API calls, persistence, or navigation beyond showing the screen (unless explicitly requested later).

## Target Folder Structure
```text
lib/
├── main.dart                    # App entry, theme setup, routing
├── core/
│   └── theme/
│       ├── app_colors.dart      # Color constants (gradients, accents)
│       └── app_theme.dart       # ThemeData configuration
├── features/
│   └── input/
│       ├── input_page.dart      # Main input page widget
│       └── widgets/
│           ├── mood_text_field.dart      # Text input with char counter
│           ├── genre_dropdown.dart       # Genre selector dropdown
│           ├── age_selector.dart         # Age suitability card selector
│           └── action_buttons.dart       # Primary + secondary actions
└── shared/
    └── widgets/
        └── frosted_card.dart    # Reusable frosted glass card container
```

## Task 1 — Setup Base (Theme + Background + Header)
**Goal:** Establish the design system and scaffold-level UI (gradient background and app header).

### Work items
- Create `lib/core/theme/app_colors.dart`
  - Define gradient colors:
    - Coral: `#FF6B6B`
    - Purple: `#6C5CE7`
  - Define accent/neutral colors used by controls (borders, text, button fills).
- Create `lib/core/theme/app_theme.dart`
  - `ThemeData` for typography, button styles, input decoration defaults, radii.
  - Keep it minimal and production-quality (readable contrast, consistent spacing).
- Implement gradient background scaffold (coral → purple) on the Input page container.
  - Ensure **no phone/device mock background** is used.
- Build the header section:
  - Movie clapboard icon + “Film AI” title
  - Spacing aligned to the mock direction (centered header above the frosted card).

### Acceptance criteria
- App launches to a full-screen gradient background (coral → purple).
- Header displays clapboard icon and “Film AI” consistently across device sizes.
- Theme is applied globally via `ThemeData` (no ad-hoc styling for everything).

## Task 2 — Build Input Components (Mood + Genre + Age)
**Goal:** Build the core form controls as reusable widgets.

### Work items
- `lib/features/input/widgets/mood_text_field.dart`
  - Text input with placeholder
  - Max length 75 with visible “75 chars max” / counter behavior
  - Production-ready UX: clear label, focus state, error-ready styling
- `lib/features/input/widgets/genre_dropdown.dart`
  - Dropdown with genre options (e.g., Action, Comedy, Drama, Sci‑Fi, Thriller, Romance)
  - Styled to match theme (rounded corners, subtle borders)
- `lib/features/input/widgets/age_selector.dart`
  - Three selectable cards/tiles: Kids / Family / Mature
  - Each tile has an icon + label and a clear selected state (outline/glow/check badge)
  - Single-select behavior

### Acceptance criteria
- Mood field enforces 75 chars and displays the max/counter clearly.
- Genre dropdown renders and selects correctly.
- Age tiles are selectable (exactly one selected) and visually match the design direction.

## Task 3 — Final Touch-ups (Frosted Card + Action Buttons)
**Goal:** Build shared “frosted glass” container and the two action buttons.

### Work items
- `lib/shared/widgets/frosted_card.dart`
  - Reusable frosted container using blur + opacity + border + shadow
  - Parameterized padding/radius so other screens can reuse later
- `lib/features/input/widgets/action_buttons.dart`
  - Primary button: “Get Recommendations”
  - Secondary button: “Similar to Last Time”
  - Match the design: primary looks emphasized; secondary looks outlined/ghost

### Acceptance criteria
- Frosted card looks “glass-like” over the gradient background with good readability.
- Buttons have consistent sizing, spacing, and theming.

## Task 4 — Assemble Page + Wire Entry Point
**Goal:** Compose the full page layout and make it the app’s initial route.

### Work items
- `lib/features/input/input_page.dart`
  - Compose header + frosted card + mood field + genre + age tiles + buttons
  - Ensure responsive layout (works on small and large phones)
- Update `lib/main.dart`
  - Replace counter app
  - Apply `AppTheme` and set home to `InputPage`

### Acceptance criteria
- Final Input page matches the intended layout from the reference image:
  - Gradient background
  - Centered header
  - Frosted card containing form controls + actions
- No runtime errors; hot reload works; UI is stable across common device sizes.

