import 'package:flutter/material.dart';

class Bounceable extends StatefulWidget {
  const Bounceable({
    super.key,
    this.scaleDecrease = 0.1,
    required this.child,
  });

  final double scaleDecrease;
  final Widget child;

  @override
  State<Bounceable> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<Bounceable>
    with SingleTickerProviderStateMixin {
  late final AnimationController _boubceController;
  late Size childsSize;

  void _animateReverse() {
    _boubceController.reverse();
  }

  void _animateForward() {
    _boubceController.forward();
  }

  void _handlePointerMove(PointerMoveEvent event) {
    final localOffset = event.localPosition;
    print(localOffset);
    if (localOffset.dx > childsSize.width ||
        localOffset.dy > childsSize.height ||
        localOffset.dx < 0 ||
        localOffset.dy < 0) {
      _animateReverse();
    }
  }

  Size _getChildsSize() {
    final renderBox = context.findRenderObject() as RenderBox;
    return renderBox.size;
  }

  void _handlePostFrameCallback(Duration timestamp) {
    childsSize = _getChildsSize();
  }

  @override
  void initState() {
    _boubceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    childsSize = Size.zero;
    WidgetsBinding.instance.addPostFrameCallback(_handlePostFrameCallback);
    super.initState();
  }

  @override
  void dispose() {
    _boubceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _boubceController,
      builder: (context, child) {
        final scale = 1 - _boubceController.value / (1 / widget.scaleDecrease);
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
        child: widget.child,
      ),
    );
  }
}
