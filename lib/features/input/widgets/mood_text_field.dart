import 'package:flutter/material.dart';

/// A text input field for capturing the user's mood description.
///
/// Features:
/// - Max length of 75 characters with visible counter
/// - Production-ready UX with clear label and placeholder
/// - Focus state styling via theme
class MoodTextField extends StatefulWidget {
  const MoodTextField({
    super.key,
    this.initialValue,
    this.onChanged,
  });

  /// Initial value for the text field.
  final String? initialValue;

  /// Callback when the text value changes.
  final ValueChanged<String>? onChanged;

  /// Maximum character limit for mood input.
  static const int maxLength = 75;

  @override
  State<MoodTextField> createState() => _MoodTextFieldState();
}

class _MoodTextFieldState extends State<MoodTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Describe your mood',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.black87,
              ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _controller,
          maxLength: MoodTextField.maxLength,
          maxLines: 1,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            hintText: 'I want something exciting and fun...',
            counterText: '', // Hide default counter, we use custom one below
          ),
          onChanged: widget.onChanged,
        ),
        const SizedBox(height: 4),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '${MoodTextField.maxLength} chars max',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black54,
                  fontSize: 12,
                ),
          ),
        ),
      ],
    );
  }
}
