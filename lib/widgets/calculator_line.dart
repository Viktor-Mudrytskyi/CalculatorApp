import 'package:calculator_app/theme/app_theme_data.dart';
import 'package:flutter/material.dart';

class CalculatorLine extends StatelessWidget {
  const CalculatorLine({
    super.key,
    required this.line,
    required this.highlightSymbols,
  });
  final String line;
  final List<String> highlightSymbols;

  @override
  Widget build(BuildContext context) {
    final tempTheme = AppThemeData.light();
    return Text.rich(
      TextSpan(
        children: List.generate(
          line.length,
          (index) => TextSpan(
            text: line[index],
            style: tempTheme.textStyles.calculation.copyWith(
              color: !highlightSymbols.contains(line[index])
                  ? tempTheme.colors.calculation
                  : tempTheme.colors.calculationOperation,
            ),
          ),
        ),
      ),
    );
  }
}
