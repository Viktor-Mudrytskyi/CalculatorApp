import 'package:calculator_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({
    super.key,
    required this.size,
    required this.value,
    required this.onTap,
  });
  final Size size;
  final String value;
  final void Function(String value) onTap;
  @override
  Widget build(BuildContext context) {
    final tempTheme = AppThemeData.light();
    return Bounceable(
      child: GestureDetector(
        onTap: () {
          onTap(value);
        },
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
            child: Text(
              value,
              style: tempTheme.textStyles.number.copyWith(
                color: tempTheme.colors.number,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
