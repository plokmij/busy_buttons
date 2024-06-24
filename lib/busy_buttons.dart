import 'package:flutter/material.dart';

class BusyTextButton extends StatefulWidget {
  const BusyTextButton({
    super.key,
    required this.busyChild,
    required this.child,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    required this.autofocus,
    this.clipBehavior,
    this.statesController,
    this.isSemanticButton,
    this.iconAlignment,
  });

  final Widget child;
  final Widget busyChild;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final ValueSetter<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus; // false,
  final Clip? clipBehavior;
  final WidgetStatesController? statesController;
  final bool? isSemanticButton;
  final AlignmentGeometry? iconAlignment;

  @override
  State<BusyTextButton> createState() => _BusyTextButtonState();
}

class _BusyTextButtonState extends State<BusyTextButton> {
  bool _isBusy = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: !_isBusy
          ? () {
              try {
                _isBusy = true;
                widget.onPressed();
              } catch (_) {
              } finally {
                _isBusy = false;
              }
            }
          : null,
      statesController: widget.statesController,
      child: _isBusy ? widget.busyChild : widget.child,
    );
  }
}
