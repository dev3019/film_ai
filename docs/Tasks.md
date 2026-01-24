# Tasks: Input Page UI Implementation

## Overview
Build the Input Page UI for Film AI based on the approved mockup design.

**Reference:** Design mockup at `assets/input_page.png`

---

## Folder Structure

```
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
│           ├── age_selector.dart         # Age rating card selector
│           └── action_buttons.dart       # Get Recommendations + History buttons
└── shared/
    └── widgets/
        └── frosted_card.dart    # Reusable frosted glass card container
```

---

## Task 1: Setup Base

**Objective:** Establish the foundational theme, colors, and base screen layout.

### 1.1 Create `lib/core/theme/app_colors.dart`
- Define gradient colors:
  - Coral: `#ff6b6b`
  - Purple: `#6c5ce7`
- Define accent colors for buttons, selections, icons
- Define text colors (white, dark gray, muted gray)
- Define card colors (frosted white with opacity)

### 1.2 Create `lib/core/theme/app_theme.dart`
- Configure `ThemeData` with custom color scheme
- Set default text styles (headings, body, labels)
- Configure input decoration theme
- Configure button themes

### 1.3 Create Gradient Background
- Implement `LinearGradient` from coral (top) to purple (bottom)
- Apply as `BoxDecoration` on main container

### 1.4 Build App Header
- "Film AI" text in white, bold
- Movie clapboard icon (`Icons.movie_creation` or similar)
- Position at top of screen above the form card

**Files to create:**
- `lib/core/theme/app_colors.dart`
- `lib/core/theme/app_theme.dart`

**Acceptance Criteria:**
- [ ] Colors are defined as constants and reusable
- [ ] Theme is applied app-wide via `MaterialApp`
- [ ] Gradient background renders correctly
- [ ] Header displays "Film AI" with clapboard icon

---

## Task 2: Build Input Components

**Objective:** Create the individual form widgets for user input.

### 2.1 Create `lib/features/input/widgets/mood_text_field.dart`
- Text input field with rounded corners
- Placeholder: "I want something exciting and fun..."
- Character counter showing "X/75" or "75 chars max"
- Max length: 75 characters
- Label above: "Describe your mood"

### 2.2 Create `lib/features/input/widgets/genre_dropdown.dart`
- Dropdown selector with label "Genre"
- Options: All Genres, Action & Adventure, Comedy, Drama, Horror, Romance, Sci-Fi, Thriller, Animation, Documentary
- Rounded border styling to match design
- Chevron/dropdown icon

### 2.3 Create `lib/features/input/widgets/age_selector.dart`
- Three selectable card tiles in a row
- Each card contains:
  - Icon (Kids: baby face, Family: family group, Mature: 18+ symbol)
  - Label text below icon
- Selected state:
  - Highlighted border (coral/red)
  - Checkmark badge in corner
- Only one can be selected at a time (radio behavior)

**Files to create:**
- `lib/features/input/widgets/mood_text_field.dart`
- `lib/features/input/widgets/genre_dropdown.dart`
- `lib/features/input/widgets/age_selector.dart`

**Acceptance Criteria:**
- [ ] Mood text field enforces 75 char limit with visible counter
- [ ] Genre dropdown displays options and captures selection
- [ ] Age selector allows single selection with visual feedback
- [ ] All widgets match mockup styling

---

## Task 3: Final Touch-ups

**Objective:** Create supporting UI components for polish and interaction.

### 3.1 Create `lib/shared/widgets/frosted_card.dart`
- Reusable container widget
- Frosted glass effect using `BackdropFilter` with `ImageFilter.blur`
- Semi-transparent white background (~80% opacity)
- Rounded corners (16-20px radius)
- Accepts child widget

### 3.2 Create `lib/features/input/widgets/action_buttons.dart`
- Primary button: "Get Recommendations"
  - Gradient background (coral to orange/red)
  - White text
  - Magic wand/sparkle icon (`Icons.auto_fix_high`)
  - Full width or prominent sizing
- Secondary button: "Similar to Last Time"
  - Outlined/ghost style (coral border, transparent background)
  - Coral text
  - Refresh/history icon (`Icons.refresh` or `Icons.history`)

**Files to create:**
- `lib/shared/widgets/frosted_card.dart`
- `lib/features/input/widgets/action_buttons.dart`

**Acceptance Criteria:**
- [ ] Frosted card creates blur effect over gradient background
- [ ] Primary button has gradient fill and icon
- [ ] Secondary button has outlined style
- [ ] Buttons are sized appropriately for touch targets

---

## Task 4: Assemble All

**Objective:** Compose all widgets into the final InputPage and wire up the app.

### 4.1 Create `lib/features/input/input_page.dart`
- Scaffold with gradient background (no AppBar)
- SafeArea for device notches
- Layout structure:
  ```
  Column
  ├── App Header ("Film AI" + icon)
  ├── Spacer/Padding
  └── FrostedCard
      └── Column
          ├── MoodTextField
          ├── Row [GenreDropdown, (spacing)]
          ├── AgeSelector
          └── ActionButtons
  ```
- Proper spacing and padding throughout
- Scrollable if content overflows (SingleChildScrollView)

### 4.2 Update `lib/main.dart`
- Import and apply `AppTheme`
- Set `home` to `InputPage`
- Update app title to "Film AI"
- Remove boilerplate counter code

**Files to create/modify:**
- `lib/features/input/input_page.dart` (create)
- `lib/main.dart` (modify)

**Acceptance Criteria:**
- [ ] InputPage renders all components in correct layout
- [ ] Spacing matches mockup design
- [ ] App launches directly to InputPage
- [ ] No overflow or layout issues on different screen sizes
- [ ] Frosted card effect is visible over gradient

---

## Dependencies

No additional packages required. Using Flutter built-in widgets:
- `LinearGradient` for background
- `BackdropFilter` + `ImageFilter.blur` for frosted glass
- `DropdownButtonFormField` for genre selector
- Material Icons for all iconography

---

## Design Specifications

| Element | Value |
|---------|-------|
| Gradient Start (Top) | `#ff6b6b` (Coral) |
| Gradient End (Bottom) | `#6c5ce7` (Purple) |
| Primary Button Gradient | Coral to Orange-Red |
| Card Background | White @ 80-85% opacity |
| Card Blur | `sigmaX: 10, sigmaY: 10` |
| Card Border Radius | 16-20px |
| Text Input Max Length | 75 characters |
| Age Options | Kids, Family, Mature |

---

## Status

| Task | Status |
|------|--------|
| Task 1: Setup Base | Pending |
| Task 2: Build Input Components | Pending |
| Task 3: Final Touch-ups | Pending |
| Task 4: Assemble All | Pending |
