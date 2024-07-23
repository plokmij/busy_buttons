import 'package:flutter/material.dart';

class BusyTextButton extends StatefulWidget {
  const BusyTextButton({
    super.key,
    this.busyChild,
    required this.child,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior,
    this.statesController,
    this.isSemanticButton,
    this.iconAlignment,
  });

  final Widget child;
  final Widget? busyChild;
  final Future<void> Function() onPressed;
  final VoidCallback? onLongPress;
  final ValueSetter<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus; // false,
  final Clip? clipBehavior;
  final WidgetStatesController? statesController;
  final bool? isSemanticButton;
  final IconAlignment? iconAlignment;

  @override
  State<BusyTextButton> createState() => _BusyTextButtonState();
}

class _BusyTextButtonState extends State<BusyTextButton> {
  bool _isBusy = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: !_isBusy
          ? () async {
              try {
                setState(() {
                  _isBusy = true;
                });
                await widget.onPressed();
              } catch (_) {
              } finally {
                setState(() {
                  _isBusy = false;
                });
              }
            }
          : null,
      onLongPress: widget.onLongPress,
      onFocusChange: widget.onFocusChange,
      onHover: widget.onHover,
      style: widget.style,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior,
      statesController: widget.statesController,
      isSemanticButton: widget.isSemanticButton,
      iconAlignment: widget.iconAlignment ?? IconAlignment.start,
      child: (widget.busyChild != null && _isBusy)
          ? widget.busyChild!
          : widget.child,
    );
  }
}

extension BusyExtension on TextButton {
  static Widget busy({
    required Widget child,
    required Widget busyChild,
    required Future<void> Function() onPressed,
    VoidCallback? onLongPress,
    ValueSetter<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip? clipBehavior,
    WidgetStatesController? statesController,
    bool? isSemanticButton,
    IconAlignment? iconAlignment,
  }) {
    return BusyTextButton(
      busyChild: busyChild,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      statesController: statesController,
      isSemanticButton: isSemanticButton,
      iconAlignment: iconAlignment,
      child: child,
    );
  }
}
