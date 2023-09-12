import 'package:calculator_app/theme/app_theme_data.dart';
import 'package:flutter/material.dart';

class CalculationLine extends StatelessWidget {
  const CalculationLine({
    super.key,
    required this.line,
  });
  final String line;

  static const _highlightSymbols = [
    '/',
    '+',
    '-',
    '%',
    '*',
  ];

  @override
  Widget build(BuildContext context) {
    final tempTheme = AppThemeData.light();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Text.rich(
        TextSpan(
          children: line.isNotEmpty
              ? List.generate(
                  line.length,
                  (index) => TextSpan(
                    text: line[index],
                    style: tempTheme.textStyles.calculation.copyWith(
                      color: !_highlightSymbols.contains(line[index])
                          ? tempTheme.colors.calculation
                          : tempTheme.colors.calculationOperation,
                    ),
                  ),
                )
              : [
                  TextSpan(
                    text: ' ',
                    style: tempTheme.textStyles.calculation
                        .copyWith(color: tempTheme.colors.calculation),
                  ),
                ],
        ),
        maxLines: 1,
      ),
    );
  }
}
