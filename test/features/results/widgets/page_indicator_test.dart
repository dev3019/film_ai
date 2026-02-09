import 'package:film_ai/features/results/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildSubject({required int count, required int currentIndex}) {
    return MaterialApp(
      home: Scaffold(
        body: PageIndicator(count: count, currentIndex: currentIndex),
      ),
    );
  }

  group('PageIndicator', () {
    testWidgets('renders dot count equal to pages', (tester) async {
      await tester.pumpWidget(buildSubject(count: 4, currentIndex: 0));

      expect(find.byType(AnimatedContainer), findsNWidgets(4));
    });

    testWidgets('marks active dot with wider width', (tester) async {
      await tester.pumpWidget(buildSubject(count: 3, currentIndex: 1));

      final dots = tester.widgetList<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final widths = dots
          .map((dot) => (dot.constraints?.maxWidth ?? 0).toDouble())
          .toList();
      expect(widths.contains(18), isTrue);
    });
  });
}
