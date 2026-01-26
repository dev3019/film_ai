import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Age suitability categories for movie recommendations.
enum AgeCategory {
  kids('Kids', Icons.child_care),
  family('Family', Icons.family_restroom),
  mature('Mature', Icons.no_adult_content);

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
/// - Visual selected state with border and checkmark badge
/// - Icons and labels for each option
class AgeSelector extends StatelessWidget {
  const AgeSelector({
    super.key,
    this.value,
    this.onChanged,
  });

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
    final Color accentColor = AppColors.coral;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? accentColor.withValues(alpha: 0.1)
              : Colors.white.withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? accentColor : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: accentColor.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? accentColor
                          : accentColor.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      category.icon,
                      color: isSelected ? Colors.white : accentColor,
                      size: 24,
                    ),
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
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w500,
                          color: isSelected ? accentColor : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isSelected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: accentColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
          ],
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
