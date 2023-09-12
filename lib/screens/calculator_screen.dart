import 'package:calculator_app/provider/calculator_provider.dart';
import 'package:calculator_app/theme/app_theme_data.dart';
import 'package:calculator_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final systemPadding = MediaQuery.paddingOf(context);
    return ChangeNotifierProvider<CalculatorProvider>(
      create: (context) => CalculatorProvider(),
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: AppThemeData.light().gradients.backgroundGradient,
          ),
          child: Padding(
            padding: systemPadding,
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Consumer<CalculatorProvider>(
                  builder: (context, calculatorProvider, _) {
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .35,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CalculationLine(
                                    line: calculatorProvider.calculationLine),
                                ResultLine(result: calculatorProvider.result),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 4 / 3,
                            child: CalculatorBody(
                              onTileTap: calculatorProvider.onCalculatorItemTap,
                              onClearTap: calculatorProvider.onClearTap,
                              onClearLongTap: calculatorProvider.onClearLongTap,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
