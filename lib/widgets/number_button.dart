import 'package:calculator_app/theme/theme.dart';
import 'package:flutter/material.dart';

class NumberButton extends StatefulWidget {
  const NumberButton({
    super.key,
    required this.value,
    required this.onTap,
    required this.side,
    this.scaleDecrease = 0.1,
  });
  final double side;
  final int value;
  final double scaleDecrease;
  final void Function(int value) onTap;

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _boubceController;

  void _animateReverse() {
    _boubceController.reverse();
  }

  void _animateForward() {
    _boubceController.forward();
  }

  void _handlePointerMove(PointerMoveEvent event) {
    final localOffset = event.localPosition;
    if (localOffset.dx > widget.side ||
        localOffset.dy > widget.side ||
        localOffset.dx < 0 ||
        localOffset.dy < 0) {
      _animateReverse();
    }
  }

  @override
  void initState() {
    _boubceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    super.initState();
  }

  @override
  void dispose() {
    _boubceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tempTheme = AppThemeData.light();
    return SizedBox(
      width: widget.side,
      height: widget.side,
      child: ColoredBox(
        color: Colors.pink,
        child: AnimatedBuilder(
          animation: _boubceController,
          builder: (context, child) {
            final scale =
                1 - _boubceController.value / (1 / widget.scaleDecrease);
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..scale(scale),
              child: child!,
            );
          },
          child: Listener(
            onPointerDown: (event) {
              _animateForward();
            },
            onPointerUp: (event) {
              _animateReverse();
            },
            onPointerMove: _handlePointerMove,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: tempTheme.gradients.numberButtonBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 1,
                  color: tempTheme.colors.buttonBorderColor,
                ),
              ),
              child: Center(
                child: Text(
                  widget.value.toString(),
                  style: tempTheme.textStyles.number.copyWith(
                    color: tempTheme.colors.numberColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
