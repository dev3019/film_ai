import 'package:film_ai/shared/widgets/gradient_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget buildSubject({VoidCallback? onPressed}) {
  return MaterialApp(
    home: Scaffold(
      body: GradientOutlinedButton(
        label: 'Test Label',
        icon: Icons.star,
        onPressed: onPressed,
      ),
    ),
  );
}

void main() {
  group('GradientOutlinedButton', () {
    testWidgets('displays label text', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.text('Test Label'), findsOneWidget);
    });

    testWidgets('displays icon', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('invokes onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        buildSubject(onPressed: () => tapped = true),
      );

      await tester.tap(find.text('Test Label'));
      expect(tapped, isTrue);
    });

    testWidgets('does not crash when onPressed is null', (tester) async {
      await tester.pumpWidget(buildSubject());

      // Tapping should not throw.
      await tester.tap(find.text('Test Label'));
      await tester.pump();
    });

    testWidgets('uses ShaderMask for gradient text', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.byType(ShaderMask), findsOneWidget);
    });
  });
}
