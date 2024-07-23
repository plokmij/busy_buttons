import 'package:flutter_test/flutter_test.dart';

import 'package:busy_buttons/busy_buttons.dart';

import 'package:flutter/material.dart';

void main() {
  testWidgets('BusyTextButton displays text when not busy',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BusyTextButton(
            onPressed: () async {},
            child: const Text('Button'),
          ),
        ),
      ),
    );

    expect(find.text('Button'), findsOneWidget);
  });

  testWidgets('BusyTextButton displays text Loading when busy',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BusyTextButton(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 10));
            },
            busyChild: const Text('Loading'),
            child: const Text('Button'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Button'));
    expect(find.text('Loading'), findsOneWidget);
  });

  testWidgets('BusyTextButton calls onPressed when tapped',
      (WidgetTester tester) async {
    bool onPressedCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BusyTextButton(
            onPressed: () async {
              onPressedCalled = true;
            },
            child: const Text('Button'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Button'));
    expect(onPressedCalled, isTrue);
  });
}
