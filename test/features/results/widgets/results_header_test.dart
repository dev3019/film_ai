import 'package:film_ai/features/results/widgets/results_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildSubject() {
    return const MaterialApp(
      home: Scaffold(body: ResultsHeader()),
    );
  }

  group('ResultsHeader', () {
    testWidgets('displays "Your Picks" title', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(find.text('Your Picks'), findsOneWidget);
    });

    testWidgets('displays a back chevron icon', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(find.byIcon(Icons.chevron_left), findsOneWidget);
    });

    testWidgets('back button triggers Navigator.pop', (tester) async {
      var didPop = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const Scaffold(body: ResultsHeader()),
                    ),
                  );
                },
                child: const Text('Go'),
              ),
            ),
          ),
          navigatorObservers: [_PopObserver(() => didPop = true)],
        ),
      );

      // Navigate to the results header page.
      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      // Tap the back button.
      await tester.tap(find.byIcon(Icons.chevron_left));
      await tester.pumpAndSettle();

      expect(didPop, isTrue);
    });
  });
}

class _PopObserver extends NavigatorObserver {
  _PopObserver(this.onPop);

  final VoidCallback onPop;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onPop();
  }
}
