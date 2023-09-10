import 'package:calculator_app/theme/theme.dart';
import 'package:calculator_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {
  const OperationButton({
    super.key,
    required this.size,
    required this.value,
    required this.onTap,
    this.backgroundGradient,
  });
  final Size size;
  final String value;
  final void Function(String value) onTap;
  final Gradient? backgroundGradient;

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
            gradient: backgroundGradient ?? tempTheme.gradients.operationButton,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1,
              color: tempTheme.colors.operationButtonBorder,
            ),
          ),
          child: Center(
            child: Text(
              value.toString(),
              style: tempTheme.textStyles.number.copyWith(
                color: tempTheme.colors.operation,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
