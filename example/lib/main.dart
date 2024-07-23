import 'package:busy_buttons/busy_buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _onPressedCount = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text('onPressed count: $_onPressedCount'),
            ),
            Center(
              child: BusyTextButton(
                onPressed: () async {
                  setState(() {
                    _onPressedCount++;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                },
                busyChild: const Text('Please Wait'),
                child: const Text('Click Me'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
