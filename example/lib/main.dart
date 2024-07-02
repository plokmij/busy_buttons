import 'package:busy_buttons/busy_buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Center(
          child: BusyTextButton(
            onPressed: () async{
             await Future.delayed(const Duration(seconds: 2));
             print('hola mundo');
            },
            busyChild: const Text('Please Wait'),
            child: const Text('No so long'),
          ),
        ),
      ),
    );
  }
}
