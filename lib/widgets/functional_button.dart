import 'package:calculator_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class FunctionalButton extends StatelessWidget {
  const FunctionalButton({
    super.key,
    required this.size,
    required this.onTap,
    required this.child,
  });
  final Size size;
  final Widget child;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final tempTheme = AppThemeData.light();
    return Bounceable(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: tempTheme.gradients.numberButtonBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1,
              color: tempTheme.colors.buttonBorder,
            ),
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
