import 'package:flutter/material.dart';

import '../theme/theme.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({
    super.key,
    required this.side,
    required this.value,
    required this.onTap,
  });
  final double side;
  final int value;
  final void Function(int value) onTap;
  @override
  Widget build(BuildContext context) {
    final tempTheme = AppThemeData.light();
    return Container(
      height: side,
      width: side,
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
          value.toString(),
          style: tempTheme.textStyles.number.copyWith(
            color: tempTheme.colors.numberColor,
          ),
        ),
      ),
    );
  }
}
