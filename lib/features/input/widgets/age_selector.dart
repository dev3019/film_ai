import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Age suitability categories for movie recommendations.
enum AgeCategory {
  kids('Kids', Icons.child_friendly),
  family('Family', Icons.family_restroom),
  mature('Mature', Icons.not_interested);

  const AgeCategory(this.label, this.icon);

  /// Display label for the category.
  final String label;

  /// Icon representing the category.
  final IconData icon;
}

/// A selector widget with three tile cards for age suitability.
///
/// Features:
/// - Single-select behavior
/// - Gradient icon background matching app theme
/// - Elevated selected state with gradient border
/// - Compact square tiles
class AgeSelector extends StatelessWidget {
  const AgeSelector({super.key, this.value, this.onChanged});

  /// Currently selected age category.
  final AgeCategory? value;

  /// Callback when an age category is selected.
  final ValueChanged<AgeCategory>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: AgeCategory.values.map((category) {
        final bool isSelected = value == category;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: category == AgeCategory.kids ? 0 : 6,
              right: category == AgeCategory.mature ? 0 : 6,
            ),
            child: _AgeTile(
              category: category,
              isSelected: isSelected,
              onTap: () => onChanged?.call(category),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _AgeTile extends StatelessWidget {
  const _AgeTile({
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  final AgeCategory category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const double selectedInset = 2;
    const double badgeSize = 20;
    final double badgeOffset = -(badgeSize / 2 - selectedInset);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          // Gradient border for selected state
          gradient: isSelected ? AppColors.backgroundGradient : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.purple.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Container(
          margin: EdgeInsets.all(isSelected ? 2 : 0),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white, // White container background
            borderRadius: BorderRadius.circular(isSelected ? 14 : 16),
            border: isSelected
                ? null
                : Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon with gradient background
                    _GradientIconCircle(
                      size: 48,
                      icon: category == AgeCategory.kids ? null : category.icon,
                      child: category == AgeCategory.kids
                          ? Text(
                              _getEmoji(category),
                              style: const TextStyle(fontSize: 24, height: 1),
                            )
                          : null,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _getEmoji(category),
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          category.label,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87, // Default font color always
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Positioned(
                  top: badgeOffset,
                  right: badgeOffset,
                  child: const _GradientCheckBadge(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _getEmoji(AgeCategory category) {
    return switch (category) {
      AgeCategory.kids => '👶',
      AgeCategory.family => '👨‍👩‍👧',
      AgeCategory.mature => '🔞',
    };
  }
}

/// A circular icon container with gradient background.
class _GradientIconCircle extends StatelessWidget {
  const _GradientIconCircle({required this.size, this.icon, this.child});

  final double size;
  final IconData? icon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    assert((icon == null) != (child == null), 'Provide either icon or child');

    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        gradient: AppColors.backgroundGradient,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: child ?? Icon(icon, color: Colors.white, size: size * 0.5),
      ),
    );
  }
}

/// A small checkmark badge with gradient background.
class _GradientCheckBadge extends StatelessWidget {
  const _GradientCheckBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        gradient: AppColors.backgroundGradient,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: const Icon(Icons.check, color: Colors.white, size: 12),
    );
  }
}
