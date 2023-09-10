import 'package:calculator_app/theme/app_theme_data.dart';
import 'package:calculator_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final systemPadding = MediaQuery.paddingOf(context);
    final tempTheme = AppThemeData.light();
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppThemeData.light().gradients.backgroundGradient,
        ),
        child: Padding(
          padding: systemPadding,
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .35,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CalculatorLine(
                            line: '12/4+5',
                            highlightSymbols: [
                              '/',
                              '+',
                              '-',
                              '%',
                              '*',
                            ],
                          ),
                          Text(
                            '=100',
                            style: tempTheme.textStyles.result
                                .copyWith(color: tempTheme.colors.result),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: CalculatorBody(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
