import 'package:flutter/material.dart';

class BusyOutlinedButton extends StatelessWidget {
  const BusyOutlinedButton({
    super.key,
    required this.child,
    required this.busyChild,
    required this.onPressed,
  });

  final Widget child;
  final Widget busyChild;
  final Future<void> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed, child: child);
  }
}
