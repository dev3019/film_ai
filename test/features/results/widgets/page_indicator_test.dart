import 'package:film_ai/features/results/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget buildSubject({int count = 4, int currentIndex = 0}) {
  return MaterialApp(
    home: Scaffold(
      body: PageIndicator(count: count, currentIndex: currentIndex),
    ),
  );
}

void main() {
  group('PageIndicator', () {
    testWidgets('renders the correct number of dots', (tester) async {
      await tester.pumpWidget(buildSubject(count: 4));

      // Each dot is an AnimatedContainer.
      expect(find.byType(AnimatedContainer), findsNWidgets(4));
    });

    testWidgets('active dot is wider than inactive dots', (tester) async {
      await tester.pumpWidget(buildSubject(count: 3, currentIndex: 1));
      await tester.pumpAndSettle();

      final containers = tester
          .widgetList<AnimatedContainer>(find.byType(AnimatedContainer))
          .toList();

      // Default dotSize is 8, so active width should be 8 * 2.2 = 17.6
      // and inactive width should be 8.
      final activeBox = containers[1];
      final inactiveBox = containers[0];

      // Extract widths from BoxConstraints inside AnimatedContainer.
      final activeWidth = (activeBox.constraints?.maxWidth) ??
          _extractWidth(tester, 1);
      final inactiveWidth = (inactiveBox.constraints?.maxWidth) ??
          _extractWidth(tester, 0);

      expect(activeWidth, greaterThan(inactiveWidth));
    });

    testWidgets('renders zero dots when count is 0', (tester) async {
      await tester.pumpWidget(buildSubject(count: 0));
      expect(find.byType(AnimatedContainer), findsNothing);
    });
  });
}

/// Fallback width extractor via render object.
double _extractWidth(WidgetTester tester, int index) {
  final elements = find.byType(AnimatedContainer).evaluate().toList();
  final box = elements[index].renderObject as RenderBox;
  return box.size.width;
}
