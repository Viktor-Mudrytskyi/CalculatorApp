import 'package:calculator_app/theme/theme.dart';
import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {
  const OperationButton({
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
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        gradient: tempTheme.gradients.operationButton,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: tempTheme.colors.operationButtonBorderColor,
        ),
      ),
      child: Center(
        child: Text(
          value.toString(),
          style: tempTheme.textStyles.number.copyWith(
            color: tempTheme.colors.operationColor,
          ),
        ),
      ),
    );
  }
}
